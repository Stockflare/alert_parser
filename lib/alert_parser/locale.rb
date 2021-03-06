module AlertParser
  class Locale

    @@translations = {}
    @@translations_loaded = {}

    LOCALES_PATH = ENV['LOCALES_PATH']

    attr_reader :language

    def initialize(language: 'en')
      @language = language
    end

    def translations
      # Get the desired language and store it for 20 minutes
      if !@@translations[language] || !@@translations_loaded[language] || @@translations_loaded[language] < (Time.now.utc.to_i - (60 * 20) )
        @@translations[language] = Services::Transport.new('i18n', '', {locale: language}, {method: :get}).call.body[language.to_sym]
        @@translations_loaded[language] = Time.now.utc.to_i
      end

      @@translations[language]

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

    # def file(locale = 'en')
    #   @file ||= File.open(File.expand_path("#{LOCALES_PATH}/#{language}.yml", __FILE__)).read
    # end
  end
end
