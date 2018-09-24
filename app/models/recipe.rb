class Recipe < ApplicationRecord
    belongs_to :user
  	has_many :ingredients
  	has_many :directions
    has_one_attached :image

    # For images, we'll go with this: https://www.railstutorial.org/book/user_microposts#sec-basic_image_uploads

  	accepts_nested_attributes_for :ingredients,
    															reject_if: proc { |attributes| attributes['name'].blank? },
    															allow_destroy: true
   	accepts_nested_attributes_for :directions,
    															reject_if: proc { |attributes| attributes['step'].blank? },
    															allow_destroy: true

    validates :title, :description, presence: true

  end
