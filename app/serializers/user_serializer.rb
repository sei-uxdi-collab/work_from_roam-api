# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :avatar,
             :username,
             :reviews,
             :top_avg_rating,
             :find_up_voted_items
  has_many :reviews
  has_many :votes
  has_many :work_spaces
end
