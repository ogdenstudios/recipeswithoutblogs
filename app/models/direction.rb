class Direction < ApplicationRecord
  belongs_to :recipe
  default_scope { order(order: :asc) }
end
