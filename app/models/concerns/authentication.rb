# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  module ClassMethods
    def authenticate(identifier, password)
      user = User.where(email: identifier)
                 .or(User.where(username: identifier)).take
      return unless user

      user.send :new_token
      user.authenticate password
    end
  end

  # Conditions for password validation
  PASSWORD_REQUIREMENTS = /\A
    (?=.{8,})
    (?=.*\d)
    (?=.*[a-z])
    (?=.*[A-Z])
    (?=.*[[:^alnum:]])
  /x

  included do
    has_secure_password
    before_create :set_token
    after_find :fix_up_token
    validates :email, uniqueness: true
    validates :email, presence: true
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :username, format: { with: /\A[a-zA-Z0-9]+\z/,
                                   message: 'only allows letters and numbers' }
    validates :password, format: PASSWORD_REQUIREMENTS
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
