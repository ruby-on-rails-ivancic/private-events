class Event < ApplicationRecord
  belongs_to :host, class_name: "User"

  has_many :attendings, dependent: :destroy
  has_many :attendees, through: :attendings, source: :user, dependent: :destroy
  validates :name, :location, :date, :description, presence: true
end
