# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :avatar,
             :username,
             :favorites,
             :reviews,
             :top_avg_rating
end
