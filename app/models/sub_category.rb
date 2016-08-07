class SubCategory < ActiveRecord::Base
	has_many :products
	belongs_to :category
	validates_presence_of :category, :name
end
