module AlertParser
  module Parser
    class Recommendation < Base
      def positive?
        data[:upgraded]
      end

      def recommendation_text(value, locale)
        locale.recommendation(value)
      end
    end
  end
end
