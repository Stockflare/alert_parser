module AlertParser
  module Parser
    class EpsTrend < Base
      def forecast_eps(value, locale)
        currency(locale, value)
      end

      def forecast_eps_one_week_ago(value, locale)
        currency(locale, value)
      end

      def positive?
        data[:forecast_eps] > data[:forecast_eps_one_week_ago]
      end
    end
  end
end
