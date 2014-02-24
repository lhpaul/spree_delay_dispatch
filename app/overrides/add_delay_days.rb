Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
  :name => 'add_delay_days',
  :insert_bottom => "li.shipping-method",
  :text => "
  <% if spree_user_signed_in? and ship_form.object.shipping_rates.first.shipping_method.calculator.type.include? 'DelayedDispatch' %>
	<br />
  <div id='delay_dispatch_wrapper'>
    <div id='delay_dispatch_option'>
    	<h5> <%= t 'delay_dispatch'  %> </h5>
    	<span data-tooltip class='has-tip tip-top' title=\"<%= t 'delay_dispatch_hint' %>\"><%= t 'whats_this' %></span>
   	</div>
      <%= form.number_field :dispatch_days, :value => spree_current_user.calculate_delayed_dispactch_days %> <%= t 'days'  %>
  </div>
<% end %>
  ")