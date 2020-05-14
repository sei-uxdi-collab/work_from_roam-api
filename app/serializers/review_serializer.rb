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
             :petfriendly,
             :wifipass,
             :goodforgroup,
             :alcohol,
             :parking,
             :meetingspace,
             :outdoorspace,
             :user,
             :work_space,
             :created_at
  has_one :user
  has_one :work_space
end
