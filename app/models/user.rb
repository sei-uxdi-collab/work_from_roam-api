# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :work_spaces
  has_many :reviews
  has_many :votes
  acts_as_voter

  def find_up_voted_items(extra_conditions = {})
    find_voted_items extra_conditions.merge(vote_flag: true)
  end

  def voted_as_when_voting_on(votable, args = {})
    vote = find_votes(votable_id: votable.id, votable_type: votable.class.base_class.name,
                       vote_scope: args[:vote_scope]).select(:vote_flag).last
    return nil unless vote
    return vote.vote_flag
  end

  def find_votes(extra_conditions = {})
    votes.where(extra_conditions)
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
