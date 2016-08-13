class Category < ActiveRecord::Base
	has_many :sub_catgeories, dependent: :destroy
	validates_presence_of :name
	def as_json(options={})
    super(:except => [:created_at, :updated_at])
  end
end
