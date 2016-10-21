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
        data[:forecast_dps].to_f > data[:forecast_dps_yesterday].to_f
      end
    end
  end
end
