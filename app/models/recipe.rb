class Recipe < ApplicationRecord
    belongs_to :user
  	has_many :ingredients
  	has_many :directions
    mount_uploader :picture, PictureUploader
    validate  :picture_size

  	accepts_nested_attributes_for :ingredients,
    															reject_if: proc { |attributes| attributes['name'].blank? },
    															allow_destroy: true
   	accepts_nested_attributes_for :directions,
    															reject_if: proc { |attributes| attributes['step'].blank? },
    															allow_destroy: true

    validates :title, :description, presence: true

    private

      # Validates the size of an uploaded picture.
      def picture_size
        if picture.size > 5.megabytes
          errors.add(:picture, "should be less than 5MB")
        end
      end

  end
