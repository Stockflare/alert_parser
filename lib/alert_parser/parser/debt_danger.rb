module AlertParser
  module Parser
    class DebtDanger < Base
      def net_debt_to_operating_profit(value, locale)
        locale.format_ratio(value, 1)
      end

      def positive?
        data[:positive]
      end
    end
  end
end
