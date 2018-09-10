class Recipe < ApplicationRecord
  has_attached_File :image, :style => { :medium => "400x400#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
