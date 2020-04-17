# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  module ClassMethods
    def authenticate(username, email, password)
      user = User.find_by(username: username)
      user_email = User.find_by(email: email)
      return unless user || user_email

      if user
        user.send :new_token
        user.authenticate password
      elsif user_email
        user_email.send :new_token
        user_email.authenticate password
      end
    end
  end

  included do
    has_secure_password
    before_create :set_token
    after_find :fix_up_token
    validates :email, uniqueness: true
    validates :email, presence: true
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :password_confirmation, presence: true, on: :create
  end

  def logout
    new_token
  end

  # FIXME: Do I need to validate that token doesn't exist? (improbable)
  def set_token
    self.token = SecureRandom.hex(16)
  end

  # unconditionally create and set a new token
  def new_token
    update_columns(token: set_token, updated_at: Time.current)
  end

  # expire old token
  def fix_up_token
    # FIXME: token age should be configurable
    new_token if updated_at < 7.days.ago
  end

  private :set_token, :new_token, :fix_up_token
end
