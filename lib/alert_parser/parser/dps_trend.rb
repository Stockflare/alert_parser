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
        data[:forecast_dps].to_f > data[:forecast_dps_one_week_ago].to_f
      end
    end
  end
end
