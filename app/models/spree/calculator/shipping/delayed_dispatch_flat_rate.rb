require_dependency 'spree/shipping_calculator'

module Spree
	module Calculator::Shipping
		class DelayedDispatchFlatRate < ShippingCalculator
			preference :amount, :decimal, :default => 0
			preference :currency, :string, :default => Spree::Config[:currency]

			attr_accessible :preferred_amount, :preferred_currency

			def self.description
				I18n.t(:delayed_dispatch_flat_rate)
			end

			def compute(object=nil)
				return 0 if object.is_a?(Spree::Order) and  not object.user.nil? and object.user.has_delayed_dispatch?
				self.preferred_amount
			end
		end
	end
end
