class WorkSpace < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :delete_all

  # scope :max_rating, -> (rating) { joins(:reviews).group("work_spaces.id").where("rating > ?", rating) if rating }
  scope :max_rating, ->(rating) { joins(:reviews)
    .group("work_spaces.id")
    .order('AVG(reviews.rating) desc')
    .having('AVG(reviews.rating) > ?', rating) if rating }
  # Count all reviews
  def top_avg_rating
    # WorkSpace.left_joins(:reviews).group(:id).order('COUNT(reviews.id) ASC').limit(3)
    # WorkSpace.find_by reviews.order(rating: :desc).limit(2)
    # WorkSpace.joins(:reviews).where(reviews: { rating: 5 })
    # WorkSpace.where('avg_rating > 3')
    WorkSpace.max_rating(2).limit(5)
  end

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

  def top_rating
    reviews.order(rating: :desc).limit(2)
  end

  def top_bathroom
    reviews.order(bathroom: :desc).limit(2)
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
