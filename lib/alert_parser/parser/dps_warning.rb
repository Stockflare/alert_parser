module AlertParser
  module Parser
    class DpsWarning < Base
      def forecast_dps(value, locale)
        currency(locale, value)
      end

      def forecast_eps(value, locale)
        currency(locale, value)
      end

      def positive?
        data[:positive]
      end
    end
  end
end
