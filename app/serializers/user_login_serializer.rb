# frozen_string_literal: true

class UserLoginSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :username,
             :avatar,
             :favorites,
             :reviews,
             :token,
             :top_avg_rating
  has_many :reviews
  has_many :work_spaces
  def token
    Rails.application.message_verifier(:signed_token).generate(object.token)
  end
end
