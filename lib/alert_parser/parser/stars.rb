module AlertParser
  module Parser
    class Stars < Base
      def positive?
        data[:rating_difference].to_f > 0.0
      end
    end
  end
end
