class ProductProperty < ActiveRecord::Base
	belongs_to :product
  belongs_to :property
	validates_associated :property, :product
	validates_presence_of :value

	def as_json(options={})
    super(:except => [:id, :created_at, :updated_at, :product_id, :property_id],
    ).merge({:property => self.property.name})
  end
end
