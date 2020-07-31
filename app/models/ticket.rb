class Ticket < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true
  validates :status, presence: true
  validate :valid_status

  def valid_status
    unless ['new','blocked', 'in_progress', 'fixed'].include?(status)
      errors.add(:status, 'invalid status')
    end
  end

  belongs_to :project
end
