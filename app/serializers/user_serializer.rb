# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :avatar,
             :username
  has_many :reviews
  has_many :votes
  has_many :work_spaces
end
