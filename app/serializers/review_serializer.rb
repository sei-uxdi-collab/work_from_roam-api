class ReviewSerializer < ActiveModel::Serializer
  attributes :id,
             :rating,
             :note,
             :wifi,
             :food,
             :bathroom,
             :noise,
             :coffee,
             :seating,
             :user,
             :work_space
  has_one :user
  has_one :work_space
end
