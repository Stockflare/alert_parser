module AlertParser
  module Parser
    class GrowthTurn < Base
      def long_term_growth(value, locale)
        locale.format_percent(value)
      end

      def long_term_growth_yesterday(value, locale)
        locale.format_percent(value)
      end

      def timestamp(value, locale)
        day = Time.at(value.to_i).wday
        locale.translations['common']['time']['daysOfWeek'][day]
      end

      def positive?
        data[:long_term_growth] > data[:long_term_growth_yesterday]
      end
    end
  end
end
