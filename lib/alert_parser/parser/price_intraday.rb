module AlertParser
  module Parser
    class PriceIntraday < Base
      def positive?
        data[:price_change].to_f >= 0.0
      end

      def price_change(value, locale)
        locale.format_percent(value, 1)
      end
    end
  end
end
