module AlertParser
  module Parser
    class Split < Base
      def price(value, locale)
        currency(locale, value)
      end

      def price_yesterday(value, locale)
        currency(locale, value)
      end

      def split_date(value, *_)
        Time.at(value).strftime('%Y-%m-%d')
      end

      def ratio(value, *_)
        value.round(1).to_s
      end

      def timestamp(value, locale)
        day = Time.at(value.to_i).wday
        locale.translations['common']['time']['daysOfWeek'][day]
      end

      def positive?
        true
      end
    end
  end
end
