class Event < ApplicationRecord
  
  has_many :reviews
	belongs_to :host, :class_name => 'User', :foreign_key => 'user_id'
	has_many :reviewers, through: :reviews, source: :user

  validates :name, :location, :category, :price, :date, presence: true
end
