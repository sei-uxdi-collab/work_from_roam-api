# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :work_space
  belongs_to :user
end
