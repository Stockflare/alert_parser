module AlertParser
  module Parser
    class TechnicalBollingerBandsSignal < Base
      INDEX = 800

      def positive?
        data[:positive]
      end

      def price(value, locale)
        currency(locale, value)
      end


      def ttl
        60 * 60 * 24
      end

      def channels?
        %i( daily_email twitter stocktwits )
      end

    end
  end
end
