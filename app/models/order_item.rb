class OrderItem < ActiveRecord::Base
  attr_accessible :status, :name
  belongs_to :order, dependent: :destroy

  after_update :check, if: :been_comfirmed

  protected
  def check
  	raise 'name cant be lixiaolong' if name == 'lixiaolong'
  end

  def been_comfirmed
  	status_changed? && 1 == status
  end
end
