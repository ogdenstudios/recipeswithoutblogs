class Direction < ApplicationRecord
  belongs_to :recipe
  default_scope { order(order: :asc) }
  validates :step, :order, presence: true
end
