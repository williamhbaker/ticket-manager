class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :ticket
  belongs_to :user
end
