class Color < ActiveRecord::Base
  belongs_to :product
  validates_uniqueness_of :name, :code, :case_sensitive => false, :scope => :product_id

  def as_json(options={})
    super(:except => [:id, :created_at, :updated_at])
  end
end
