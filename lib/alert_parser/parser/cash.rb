module AlertParser
  module Parser
    class Cash < Base
      def net_cash_to_share_price(value, locale)
        locale.format_percent(value * 100)
      end

      def positive?
        data[:increase]
      end
    end
  end
end
