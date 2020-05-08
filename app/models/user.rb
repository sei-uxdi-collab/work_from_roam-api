# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :work_spaces
  has_many :reviews
  has_many :votes
  acts_as_voter

  # Find all work_spaces favorited by a user
  def find_up_voted_items(extra_conditions = {})
    find_voted_items extra_conditions.merge(vote_flag: true)
  end

  # Calculate average for top rated for a specific column
  scope :by_average_for, ->(column) {
    joins(:reviews)
      .group('work_spaces.id')
      .order("AVG(reviews.#{column}) desc")
      .having("AVG(reviews.#{column}) > 4", column) if column
  }

  # Find top rated work_spaces by overall rating
  def top_avg_rating
    WorkSpace.by_average_for(:rating).limit(5)
  end

end
