# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :work_spaces
  has_many :reviews
  has_many :votes
  acts_as_voter

  def favorites
    votes.where(vote_flag: true)
    # work_spaces.where(user_id: 1)
    # faves = votes.where(vote_flag: true)
  end

  def find_up_voted_items(extra_conditions = {})
    find_voted_items extra_conditions.merge(vote_flag: true)
  end
  # scope :favorite_spaces, ->(column) {
  #   joins(:votes)
  #     .where("votes.#{column} != false", column) if column
  # }
  #
  # def user_favorite
  #   User.favorite_spaces(:vote_flag)
  # end

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
