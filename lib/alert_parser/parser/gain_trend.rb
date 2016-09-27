module AlertParser
  module Parser
    class GainTrend < Base
      def long_term_gain(value, locale)
        locale.format_percent(value * 100)
      end

      def long_term_gain_one_week_ago(value, locale)
        locale.format_percent(value * 100)
      end

      def positive?
        data[:positive]
      end
    end
  end
end
