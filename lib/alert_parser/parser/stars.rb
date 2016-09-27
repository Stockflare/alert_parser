module AlertParser
  module Parser
    class Stars < Base
      def positive?
        data[:rating_difference] > 0
      end
    end
  end
end
