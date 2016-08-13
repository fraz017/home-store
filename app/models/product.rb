class Product < ActiveRecord::Base
	belongs_to :user
	belongs_to :sub_category

	has_many :product_properties
  has_many :photos
  has_many :colors
  has_many :properties, through: :product_properties

  validates_presence_of :name
  validates_associated :sub_category
end
