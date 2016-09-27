module AlertParser
  module Parser
    class EpsGrowth < Base
      def positive?
        data[:growth]
      end
    end
  end
end
