class Tweet < ApplicationRecord
  validates :schoolyear, presence: true
  validates :event, presence: true
  validates :event, length: {maximum: 200}
  validates :schoolyear, length: {maximum: 10}

  belongs_to :user
end
