class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :title, :content, presence: true
end
