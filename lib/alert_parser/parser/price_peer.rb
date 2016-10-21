module AlertParser
  module Parser
    class PricePeer < Base
      def positive?
        data[:peer_price_change].to_f >= 0.0
      end

      def peer_price_change(value, locale)
        locale.format_percent(value, 1)
      end

      def timestamp(value, locale)
        day = Time.at(value.to_i).wday
        locale.translations['common']['time']['daysOfWeek'][day]
      end
    end
  end
end
