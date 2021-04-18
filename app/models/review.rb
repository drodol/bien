class Review < ApplicationRecord

validates :title, presence: true
validates :body, length: { minimum: 10 }
validates :score, presence: true
validates :restaurant, presence: true
validates :price, presence: true
validates :cuisine, presence: true

end
