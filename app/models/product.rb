class Product < ApplicationRecord
	validates :name, :code, :price, :expiration_date, :characteristics, presence: true
end
