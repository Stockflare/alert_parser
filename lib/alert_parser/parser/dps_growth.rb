module AlertParser
  module Parser
    class DpsGrowth < Base
      def positive?
        data[:growth]
      end
    end
  end
end
