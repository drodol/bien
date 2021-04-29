class Comment < ApplicationRecord
  belongs_to :review
  profanity_filter :comment, :body
  validates :body, presence: true
end
