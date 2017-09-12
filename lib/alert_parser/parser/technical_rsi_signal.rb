module AlertParser
  module Parser
    class TechnicalRsiSignal < Base
      INDEX = 830

      def positive?
        alert.data[:positive]
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
