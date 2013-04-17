class Order < ActiveRecord::Base
  attr_accessible :status, :order_items_attributes

  has_many :order_items
  accepts_nested_attributes_for :order_items

  after_update :update_items, if: :been_confirmed

  protected

  def update_items
  	order_items.each do |item|
  		item.update_attributes(status: 1)
  	end
  end

  def been_confirmed
  	status_changed? && status == 1
  end
end
