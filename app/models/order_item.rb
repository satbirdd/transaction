class OrderItem < ActiveRecord::Base
  attr_accessible :status, :name
  belongs_to :order, dependent: :destroy
end
