module AlertParser
  module Parser
    class GainTurn < Base
      def long_term_gain(value, locale)
        locale.format_percent(value * 100)
      end

      def long_term_gain_yesterday(value, locale)
        locale.format_percent(value * 100)
      end

      def timestamp(value, locale)
        day = Time.at(value.to_i).wday
        locale.translations['common']['time']['daysOfWeek'][day]
      end

      def positive?
        data[:positive]
      end
    end
  end
end
