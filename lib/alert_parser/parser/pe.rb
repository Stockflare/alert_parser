module AlertParser
  module Parser
    class Pe < Base
      def forecast_pe(value, locale)
        locale.format_ratio(value, 0)
      end

      def forecast_pe_one_week_ago(value, locale)
        locale.format_ratio(value, 0)
      end

      def positive?
        data[:forecast_pe].to_f < data[:forecast_pe_one_week_ago].to_f
      end
    end
  end
end
