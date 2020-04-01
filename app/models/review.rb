# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :work_space
  belongs_to :user

  scope :filter_by_rating, -> { where('rating > 2')}
  # scope :filter_by_rating, ->(rating) { where rating: rating }
  def top_review_rating
    # WorkSpace.left_joins(:reviews).group(:id).order('COUNT(reviews.id) ASC').limit(3)
    # WorkSpace.find_by reviews.order(rating: :desc).limit(2)
    # Review.joins(:work_space).where(reviews: { rating: 5 })
    Review.filter_by_rating.first(2)
  end
  # def count
  #   Review.count(:rating)
  #   # Review.group(:work_space).count(:rating)
  # end
  #
  # def average
  #   Review.average(:rating).to_i
  # end
  #
  # def bool
  #   if ((Review.where(rating: 0).pluck(:rating).length.to_f /
  #   count.to_f * 100).to_i) > 25
  #     false
  #   else
  #     true
  #   end
  # end

  # def count_review
  #   Review.distinct(:rating)
  #   # WorkSpace.count(:all)
  #   # WorkSpace.select("work_spaces.*, COUNT(reviews.id) as review_count").joins("LEFT OUTER JOIN reviews ON (reviews.work_space_id = work_spaces.id)").group("work_spaces.id")
  # end
end
