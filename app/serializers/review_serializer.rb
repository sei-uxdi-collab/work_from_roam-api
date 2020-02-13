class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :note
  has_one :work_space
end
