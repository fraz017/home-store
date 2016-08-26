class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present
  validates_uniqueness_of :product_id, :scope => :order_id

  before_save :finalize

  def as_json(options={})
    super(:except => [:id, :order_id, :product_id, :created_at, :updated_at]).merge({:product => self.product})
  end

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private
	  def product_present
	    if product.nil?
	      errors.add(:product, "is not valid or is not active.")
	    end
	  end

	  def order_present
	    if order.nil?
	      errors.add(:order, "is not a valid order.")
	    end
	  end

	  def finalize
	    self[:unit_price] = unit_price
	    self[:total_price] = quantity * self[:unit_price]
	  end
end
