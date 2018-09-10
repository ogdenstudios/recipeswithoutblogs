class Recipe < ApplicationRecord
  has_attached_file :image, :style => { :medium => "400x400#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
