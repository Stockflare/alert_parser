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
        data[:target_price].to_f > data[:target_price_one_week_ago].to_f
      end
    end
  end
end
