module AlertParser
  module Parser
    class EpsTurn < Base
      def forecast_eps(value, locale)
        currency(locale, value)
      end

      def forecast_eps_yesterday(value, locale)
        currency(locale, value)
      end

      def positive?
        data[:rising]
      end
    end
  end
end
