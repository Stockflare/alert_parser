
module AlertParser
  class Locale

    attr_reader :translations
    
    def initialize(translations: {})
      @translations = translations
    end

    def translations
      @translations
    end

    def format_currency(code, value, dp = 2)
      currency(code).gsub('%n', format_number(value.to_f.round(dp)))
    end

    def format_percent(value, dp = 2)
      '%s%' % format_number(value.to_f.round(dp))
    end

    def format_ratio(value, dp = 2)
      '%sx' % format_number(value.to_f.round(dp))
    end

    def recommendation(value)
      translations['common']['wallStreetRecommendations']['titles'][value.to_s.downcase].dup
    end

    private

    def format_number(value)
      value.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end

    def currency(code = 'usd')
      translations['common']['currencies']['symbols'][code.to_s.downcase].dup
    end

  end
end
