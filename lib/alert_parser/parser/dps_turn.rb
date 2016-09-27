module AlertParser
  module Parser
    class DpsTurn < Base
      def forecast_dps(value, locale)
        currency(locale, value)
      end

      def forecast_dps_yesterday(value, locale)
        currency(locale, value)
      end

      def positive?
        data[:forecast_dps] > data[:forecast_dps_yesterday]
      end
    end
  end
end
