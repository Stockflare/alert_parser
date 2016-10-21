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
        data[:forecast_eps].to_f > data[:forecast_eps_one_week_ago].to_f
      end
    end
  end
end
