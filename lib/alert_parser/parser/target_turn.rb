module AlertParser
  module Parser
    class TargetTurn < Base
      def target_price(value, locale)
        currency(locale, value)
      end

      def price(value, locale)
        currency(locale, value)
      end

      def positive?
        data[:rising]
      end
    end
  end
end
