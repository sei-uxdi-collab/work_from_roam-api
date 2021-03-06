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
             :outlet,
             :clean,
             :work_space,
             :created_at,
             :date,
             :username,
             :avatar
  has_one :user
  has_one :work_space
end
