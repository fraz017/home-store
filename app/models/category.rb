class Category < ActiveRecord::Base
	has_many :sub_catgeories
	validates_presence_of :name
end