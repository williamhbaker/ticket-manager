class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :tags_tickets
  has_many :tickets, through: :tags_tickets

  scope :with_counts, -> {
    left_outer_joins(:tags_tickets)
      .select("tags.*, COUNT(tags_tickets.id) as tag_num")
      .group("tags.id")
  }

  scope :alphabetical, -> { order("tags.name ASC") }
end
