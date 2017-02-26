class Article < ActiveRecord::Base
  # Validation code
  validates :title, presence: true, length: { minimum: 3, maximum: 140}
  validates :description, presence: true, length: { minimum: 10 }
  
  
end