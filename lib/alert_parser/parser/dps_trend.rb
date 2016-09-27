module AlertParser
  module Parser
    class DpsTrend < Base
      def forecast_dps(value, locale)
        currency(locale, value)
      end

      def forecast_dps_one_week_ago(value, locale)
        currency(locale, value)
      end

      def positive?
        data[:forecast_dps] > data[:forecast_dps_one_week_ago]
      end
    end
  end
end
