class WorkSpaceSerializer < ActiveModel::Serializer
  attributes :id,
             :place_id,
             :lat,
             :lng,
             :reviews,
             :user,
             :count_reviews,
             :avg_rating,
             :avg_noise,
             :avg_wifi,
             :avg_bathroom,
             :avg_food,
             :avg_coffee,
             :avg_seating,
             :bool_seating,
             :bool_coffee,
             :bool_food,
             :bool_bathroom,
             :bool_wifi
  has_one :user
  has_many :reviews
end
