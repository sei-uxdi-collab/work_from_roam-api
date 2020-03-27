# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :work_space

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
