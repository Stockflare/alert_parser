module AlertParser
  module Parser
    class DebtNet < Base
      def net_cash_to_share_price(value, locale)
        locale.format_percent(value)
      end

      def positive?
        data[:positive]
      end
    end
  end
end
