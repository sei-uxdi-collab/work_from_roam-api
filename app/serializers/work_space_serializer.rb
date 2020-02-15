class WorkSpaceSerializer < ActiveModel::Serializer
  attributes :id, :place_id, :lat, :lng, :reviews, :user
  has_one :user
  has_many :reviews
end
