class WorkSpaceSerializer < ActiveModel::Serializer
  attributes :id,
             :place_id,
             :lat,
             :lng,
             :name,
             :address,
             :photo,
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
             :avg_outlet,
             :bool_outlet,
             :bool_seating,
             :bool_coffee,
             :bool_food,
             :bool_bathroom,
             :bool_wifi,
             :votes_for,
             :cached_votes_total,
             :cached_votes_score,
             :cached_votes_up,
             :cached_weighted_score,
             :cached_weighted_average,
             :top_avg_rating
  has_one :user
  has_many :reviews
end
