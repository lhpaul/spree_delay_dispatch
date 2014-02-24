class AddDispatchDaysToOrder < ActiveRecord::Migration
  def change
  	add_column :spree_orders, :dispatch_days, :integer, :default => 0
  end
end
