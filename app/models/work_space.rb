class WorkSpace < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :delete_all
  has_many :votes_for
  acts_as_votable

  # scope for averaging top_rated for a specific column
  scope :by_average_for, ->(column) {
    joins(:reviews)
      .group('work_spaces.id')
      .order(Arel.sql("AVG(reviews.#{column}) desc"))
      .having("AVG(reviews.#{column}) > 4", column) if column
  }

  # update the avg columns in work_space table (needs refactor)
  def update_bathroom
    reviews.average(:bathroom).to_f

    update(avgbathroom: reviews.average(:bathroom).to_f)
  end

  def update_noise
    reviews.average(:noise).to_f

    update(avgnoise: reviews.average(:noise).to_f)
  end

  def update_rating
    reviews.average(:rating).to_f

    update(avgrating: reviews.average(:rating).to_f)
  end

  def update_seating
    reviews.average(:seating).to_f

    update(avgseating: reviews.average(:seating).to_f)
  end

  def update_wifi
    reviews.average(:wifi).to_f

    update(avgwifi: reviews.average(:wifi).to_f)
  end

  # Calculate the top rated work_spaces
  def top_avg_rating
    WorkSpace.by_average_for(:rating).limit(5)
  end

  # Count all reviews
  def count_reviews
    reviews.size
  end

  # Averages for attributes (need to refactor)
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

  # Booleans for attributes (need to refactor)
  def bool_alcohol
    if ((reviews.where(alcohol: 0
    ).pluck(:alcohol)).length.to_f/
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

  def bool_goodforgroup
    if ((reviews.where(goodforgroup: 0
    ).pluck(:goodforgroup)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end

  def bool_meetingspace
    if ((reviews.where(meetingspace: 0
    ).pluck(:meetingspace)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end

  def bool_outdoorspace
    if ((reviews.where(outdoorspace: 0
    ).pluck(:outdoorspace)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end

  def bool_outlet
    if ((reviews.where(outlet: 0
    ).pluck(:outlet)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end

  def bool_parking
    if ((reviews.where(parking: 0
    ).pluck(:parking)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end

  def bool_petfriendly
    if ((reviews.where(petfriendly: 0
    ).pluck(:petfriendly)).length.to_f/
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

  def bool_wifi
    if ((reviews.where(wifi: 0
    ).pluck(:wifi)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end

  def bool_wifipass
    if ((reviews.where(wifipass: 0
    ).pluck(:wifipass)).length.to_f/
    count_reviews * 100) > 25
      false
    else
      true
    end
  end
end
