class Review < ApplicationRecord

#add an association with a one-to-many relationship
has_many :comments
has_many :bookmarks
belongs_to :user

geocoded_by :address
after_validation :geocode


validates :title, presence: true
validates :body, length: { minimum: 10 }
validates :score, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
validates :restaurant, presence: true
validates :price, presence: true
validates :cuisine, presence: true
validates :address, presence: true

def to_param
id.to_s + "-" + title.parameterize 

end

end
