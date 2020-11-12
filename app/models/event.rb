class Event < ApplicationRecord
  
  has_many :reviews
	belongs_to :host, class_name: "User"
	has_many :reviewers, through: :reviews, source: :user

  validates :name, :location, :category, :price, :location, presence: true
end
