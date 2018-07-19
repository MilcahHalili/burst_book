class Customer < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    has_many :books, dependent: :destroy
    has_many :orders, dependent: :destroy

    def cart
        c = Order.find_by(customer: self, paid: false)
        c = Order.create(customer: self) unless c
        c
    end
end