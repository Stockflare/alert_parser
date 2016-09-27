module AlertParser
  module Parser
    class TargetTrend < Base
      def target_price(value, locale)
        currency(locale, value)
      end

      def target_price_one_week_ago(value, locale)
        currency(locale, value)
      end

      def positive?
        data[:target_price] > data[:target_price_one_week_ago]
      end
    end
  end
end
