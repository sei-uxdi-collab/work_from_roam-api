class WorkSpace < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :delete_all

  scope :by_average_for, ->(column) {
    joins(:reviews)
      .group('work_spaces.id')
      .order("AVG(reviews.#{column}) desc")
      .having("AVG(reviews.#{column}) > 4", column) if column
  }

  # scope :max_rating, ->(rating) { joins(:reviews)
  #   .group('work_spaces.id')
  #   .order('AVG(reviews.rating) desc')
  #   .having('AVG(reviews.rating) > ?', rating) if rating }

  # class << self
  #   def top_averages_for(column, greater_than: 2, limit: 5)
  #     by_average_for(column)
  #       .having("AVG(reviews.#{column}) > ?", greater_than)
  #       .limit(5)
  #   end
  # end
  #
  # TOP_AVG_COLUMNS = [
  #   :rating,
  #   :seating,
  #   :bathroom,
  #   :noise,
  #   :wifi
  # ].freeze
  #
  # TOP_AVG_COLUMNS.each do |column|
  #   define_method(:"top_avg_#{column}") do
  #     top_averages_for(column)
  #   end
  # end

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
