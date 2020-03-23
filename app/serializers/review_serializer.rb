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
             :count,
             :average,
             :bool
  has_one :work_space
end
