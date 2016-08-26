class SubCategory < ActiveRecord::Base
	has_many :products, dependent: :destroy
	belongs_to :category
	validates_associated :category
	validates_presence_of :name
	has_and_belongs_to_many :properties, :before_add => :validates_properties

	validates_uniqueness_of :name, :scope => :category_id
	def validates_properties(property)
  	raise ActiveRecord::Rollback if self.properties.include? property
	end
end
