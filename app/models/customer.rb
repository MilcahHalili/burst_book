class Customer < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    has_many :books, dependent: :destroy
    has_many :orders, dependent: :destroy

    def cart(current_customer)
        cart = Order.find_by(customer: current_customer, paid: false)
        cart || Order.create(customer: current_customer)
    end
end