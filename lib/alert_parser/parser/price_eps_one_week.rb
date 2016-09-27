module AlertParser
  module Parser
    class PriceEpsOneWeek < Base
      def price_change_one_week(value, locale)
        locale.format_percent(value * 100, 1)
      end

      def forecast_eps_change_one_week(value, locale)
        locale.format_percent(value, 1)
      end

      def positive?
        true
      end
    end
  end
end
