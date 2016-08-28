class Transaction < ActiveRecord::Base
  belongs_to :order
  validates_uniqueness_of :reference
end
