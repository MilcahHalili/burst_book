class Book < ApplicationRecord
  belongs_to :customer
  has_many_attached :image
end
