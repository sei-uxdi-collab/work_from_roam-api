# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :work_spaces
  has_many :reviews
  acts_as_voter

  def favorites
    votes.where(vote_flag: true)
  end

  scope :by_average_for, ->(column) {
    joins(:reviews)
      .group('work_spaces.id')
      .order("AVG(reviews.#{column}) desc")
      .having("AVG(reviews.#{column}) > 4", column) if column
  }

  def top_avg_rating
    WorkSpace.by_average_for(:rating).limit(5)
  end

end
