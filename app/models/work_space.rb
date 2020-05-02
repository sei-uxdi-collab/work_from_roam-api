class WorkSpace < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :delete_all
  acts_as_votable

  scope :by_average_for, ->(column) {
    joins(:reviews)
      .group('work_spaces.id')
      .order(Arel.sql("AVG(reviews.#{column}) desc"))
      .having("AVG(reviews.#{column}) > 4", column) if column
  }

  # def voted_as_when_voting_on(votable, args = {})
  #   vote = find_votes(votable_id: votable.id, votable_type: votable.class.base_class.name,
  #                      vote_scope: args[:vote_scope]).select(:vote_flag).last
  #   return nil unless vote
  #   return vote.vote_flag
  # end

  # def find_votes_by(voter, vote_scope)
  #   find_votes_for(voter_id: voter.id,
  #                  vote_scope: vote_scope,
  #                  voter_type: voter.class.base_class.name)
  # end

  def update_rating
    reviews.average(:rating).to_f

    update(avgrating: reviews.average(:rating).to_f)
  end

  def top_avg_rating
    WorkSpace.by_average_for(:rating).limit(5)
  end

  def top_avg_bathroom
    WorkSpace.by_average_for(:bathroom).limit(5)
  end

  def top_avg_noise
    WorkSpace.by_average_for(:noise).limit(5)
  end

  def top_avg_wifi
    WorkSpace.by_average_for(:wifi).limit(5)
  end

  def top_avg_seating
    WorkSpace.by_average_for(:seating).limit(5)
  end

  # Count all reviews
  def count_reviews
    reviews.size
  end

  # Averages for attributes
  def avg_rating
    reviews.average(:rating).to_f
  end

  def avg_noise
    reviews.average(:noise).to_f
  end

  def avg_wifi
    reviews.average(:wifi).to_f
  end

  def avg_bathroom
    reviews.average(:bathroom).to_f
  end

  def avg_food
    reviews.average(:food).to_f
  end

  def avg_coffee
    reviews.average(:coffee).to_f
  end

  def avg_seating
    reviews.average(:seating).to_f
  end

  def avg_outlet
    reviews.average(:outlet).to_f
  end

  # Booleans for attributes
  def bool_outlet
    if ((reviews.where(outlet: 0
    ).pluck(:outlet)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end

  def bool_seating
    if ((reviews.where(seating: 0
    ).pluck(:seating)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end

  def bool_coffee
    if ((reviews.where(coffee: 0
    ).pluck(:coffee)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end

  def bool_food
    if ((reviews.where(food: 0
    ).pluck(:food)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end

  def bool_bathroom
    if ((reviews.where(bathroom: 0
    ).pluck(:bathroom)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end

  def bool_wifi
    if ((reviews.where(wifi: 0
    ).pluck(:wifi)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end
end
