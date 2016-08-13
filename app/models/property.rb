class Property < ActiveRecord::Base
	validates_presence_of :name
	has_and_belongs_to_many :sub_categories, :uniq => true, :read_only => true

	def as_json(options={})
    super(:except => [:created_at, :updated_at])
  end

  has_many :product_properties
  has_many :products, through: :product_properties
end
