require "alert_parser/version"

require "yaml"

module AlertParser
  autoload :Parser, 'alert_parser/parser'
  autoload :Locale, 'alert_parser/locale'

  def self.parse(type, locale = 'en', currency_code = 'usd', data = {})
    Parser.get(type).new(Locale.new(language: locale), currency_code, data)
  end
end
