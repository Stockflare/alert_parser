module AlertParser
  module Parser
    class StarsPeers < Base
      def positive?
        false
      end

      def tickers(value, *_)
        value.to_s.upcase
      end

      def rics(value, *_)
        value.to_s.upcase
      end
    end
  end
end
