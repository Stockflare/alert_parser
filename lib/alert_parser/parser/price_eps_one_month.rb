module AlertParser
  module Parser
    class PriceEpsOneMonth < Base
      def price_change_one_month(value, locale)
        locale.format_percent(value * 100, 1)
      end

      def forecast_eps_change_one_month(value, locale)
        locale.format_percent(value, 1)
      end

      def positive?
        true
      end
    end
  end
end
