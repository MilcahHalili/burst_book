class Book < ApplicationRecord
  belongs_to :customer, optional: true
  has_many_attached :image
end
