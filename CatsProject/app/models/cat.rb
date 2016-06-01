class Cat < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  CAT_COLORS = ["red", "orange", "yellow", "green", "blue" ,"indigo", "violet"]

  validates :birthdate, :color, :name, :sex, :description, presence: true
  validates :sex, length: { is: 1 }
  validates :color, inclusion: { in: CAT_COLORS }

  has_many :cat_rental_requests, dependent: :destroy,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest


  def self.colors
    CAT_COLORS
  end

  def age
    time_ago_in_words(birthdate)
    # Date.today - birthdate
  end

end
