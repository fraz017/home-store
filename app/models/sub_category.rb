class SubCategory < ActiveRecord::Base
	has_many :products, dependant: :destroy
	belongs_to :category
	validates_associated :category
	validates_presence_of :name
	has_and_belongs_to_many :properties, :before_add => :validates_properties

	def validates_properties(property)
  	raise ActiveRecord::Rollback if self.properties.include? property
	end
end
