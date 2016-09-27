module AlertParser
  module Parser
    class SalesTrend < Base
      def positive?
        data[:rising]
      end
    end
  end
end
