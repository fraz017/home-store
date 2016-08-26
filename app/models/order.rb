class Order < ActiveRecord::Base
  belongs_to :order_status
  belongs_to :user
  has_many :order_items, dependent: :destroy
  before_create :set_order_status
  before_save :update_subtotal, :update_total
  has_one :billing_address
  has_one :shipping_address


  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def total
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
	private
	  def set_order_status
	    self.order_status_id = 1
	  end

	  def update_subtotal
	    self[:subtotal] = subtotal
	  end

    def update_total
      self[:total] = total
    end
end
