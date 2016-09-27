module AlertParser
  module Parser
    class GrowthTrend < Base
      def long_term_growth(value, locale)
        locale.format_percent(value)
      end

      def long_term_growth_one_week_ago(value, locale)
        locale.format_percent(value)
      end

      def positive?
        data[:long_term_growth] > data[:long_term_growth_one_week_ago]
      end
    end
  end
end
