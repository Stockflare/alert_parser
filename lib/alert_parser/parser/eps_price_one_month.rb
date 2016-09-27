module AlertParser
  module Parser
    class EpsPriceOneMonth < Base
      def price_change_one_month(value, locale)
        locale.format_percent(value * 100, 1)
      end

      def forecast_eps_change_one_month(value, locale)
        locale.format_percent(value * 100, 1)
      end

      def forecast_pe(value, locale)
        locale.format_ratio(value, 0)
      end

      def positive?
        true
      end
    end
  end
end
