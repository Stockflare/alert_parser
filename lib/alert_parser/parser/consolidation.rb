module AlertParser
  module Parser
    class Consolidation < Base
      def price(value, locale)
        currency(locale, value)
      end

      def price_yesterday(value, locale)
        currency(locale, value)
      end

      def ratio(value, *_)
        value.round(4).to_s
      end

      def split_date(value, *_)
        Time.at(value).strftime('%Y-%m-%d')
      end

      def timestamp(value, locale)
        day = Time.at(value.to_i).wday
        locale.translations['common']['time']['daysOfWeek'][day]
      end

      def positive?
        false
      end
    end
  end
end
