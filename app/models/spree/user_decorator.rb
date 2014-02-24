Spree::User.class_eval do

  # metodo que retorna true si es que esxiste acumulacion de despacho
  def has_delayed_dispatch?
    last_order = self.last_completed_order
    return 0 if last_order.nil?
    (last_order.completed_at.to_date + last_order.dispatch_days <=> Time.new.to_date) == 1
  end

  #metodo para obtener los dias restantes de acumulación de despacho
  def calculate_delayed_dispactch_days
    last_order = self.last_completed_order
    return 0 if last_order.nil?
    days = (last_order.completed_at.to_date + last_order.dispatch_days - Time.new.to_date).to_i
    return days > 0 ? days : 0
  end

  # para obtener la ultima orden completada
  def last_completed_order
    orders = self.orders.sort { |x,y| y.created_at <=> x.created_at }
    orders.each do |order|
      # if orders[last_index].paid?
      if order.completed?
        return order
        break
      end
    end

    return nil
  end

  def last_incomplete_spree_order
    spree_orders.incomplete.order('created_at DESC').first
  end

end