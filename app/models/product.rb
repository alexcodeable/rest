class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  has_many :order_items

  validates :name, presence: true, length: {minimum: 4, maximum: 25}
  validates :description, presence: true, length: {maximum: 500}
  validates :image, presence: true
  
  
  
  
  
end
