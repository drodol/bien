class Review < ApplicationRecord

validates :title, presence: true
validates :body, length: { minimum: 10 }
validates :score, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
validates :restaurant, presence: true
validates :price, presence: true
validates :cuisine, presence: true

def to_param
id.to_s + "-" + title.parameterize 

end

end
