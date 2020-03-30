class WorkSpace < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :delete_all

  # Count all reviews
  def count_reviews
    reviews.size
  end

  # Averages for attributes
  def avg_rating
    reviews.average(:rating).round(2)
  end

  def avg_noise
    reviews.average(:noise).round(2)
  end

  def avg_wifi
    reviews.average(:wifi).round(2)
  end

  def avg_bathroom
    reviews.average(:bathroom).round(2)
  end

  def avg_food
    reviews.average(:food).round(2)
  end

  def avg_coffee
    reviews.average(:coffee).round(2)
  end

  def avg_seating
    reviews.average(:seating).round(2)
  end

  def avg_outlet
    reviews.average(:outlet).round(2)
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
