# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :work_space

  def count
    Review.count(:all)
  end

  def average
    Review.average(:rating).to_i
  end

  def bool
    if ((Review.where(rating: 0).pluck(:rating).length.to_f /
    count.to_f * 100).to_i) > 25
      false
    else
      true
    end
  end
end
