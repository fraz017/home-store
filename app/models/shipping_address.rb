class ShippingAddress < ActiveRecord::Base
  belongs_to :order

  validates_presence_of :first_name, :last_name, :email, :mobile, :address, :pincode, :city, :state, :country
  validates_associated :order
  validates_uniqueness_of :order_id

  def as_json(options={})
    super(:except => [:created_at, :updated_at, :id])
  end
end
