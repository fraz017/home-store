class Category < ActiveRecord::Base
	has_many :sub_catgeories, dependant: :destroy
	validates_presence_of :name
end
