module AlertParser
  module Parser
    class VolumeTenDay < Base
      def positive?
        data[:price_change] > 0
      end

      def price_change(value, locale)
        locale.format_percent(value, 1)
      end

      def timestamp(value, locale)
        day = Time.at(value.to_i).wday
        locale.translations['common']['time']['daysOfWeek'][day]
      end
    end
  end
end
