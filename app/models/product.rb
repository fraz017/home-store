class Product < ActiveRecord::Base
	belongs_to :user
	belongs_to :sub_category

	has_many :product_properties
  has_many :photos
  has_many :colors
  has_many :properties, through: :product_properties

  validates_presence_of :name, :price
  validates_associated :sub_category

  has_many :order_items

  def as_json(options={})
    super(:except => [:created_at, :updated_at, :image_file_name, :image_content_type, :image_file_size, :image_updated_at]).merge({:images => self.photos})
  end
end
