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
             :outlet,
             :review
  has_one :work_space
end
