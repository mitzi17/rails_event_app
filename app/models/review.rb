class Review < ApplicationRecord
  
  belongs_to :user
  belongs_to :event

  validates :title, :content, presence: true

  def self.most_recent
    order(updated_at: :desc)
  end

end
