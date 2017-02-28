class Article < ActiveRecord::Base
  belongs_to :user
  # Validation code
  validates :title, presence: true, length: { minimum: 3, maximum: 140}
  validates :description, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true
  
  
end