class Event < ApplicationRecord
  
  has_many :reviews
	belongs_to :host, :class_name => 'User', :foreign_key => 'user_id'
	has_many :reviewers, through: :reviews, source: :user

  validates :name, :location, :category, :price, :date, presence: true

  def self.search(search)
    if search
      @event = Event.find_by(date: search)
      if @event
        self.where(date: @event.date)
      else
        @events = Event.all
      end
    end
  end

  def self.upcoming
    where("date > ?", Time.now)
  end

  def self.past_event
    where("date < ?", Time.now)
  end

  def self.order_by_highest_price
    order(price: :desc)
  end

  def self.order_by_lowest_price
    order(price: :asc)
  end

end
