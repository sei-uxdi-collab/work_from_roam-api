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
    if Review.average(:noise).to_i < 2
      false
    else
      true
    end
  end
end
