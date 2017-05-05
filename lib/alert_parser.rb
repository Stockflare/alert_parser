require "alert_parser/version"

require "yaml"

module AlertParser
  autoload :Parser, 'alert_parser/parser'
  autoload :Locale, 'alert_parser/locale'

  def self.parse(type, currency_code = 'usd', data = {}, translations = {})
    props = { locale: Locale.new(translations: translations), currency_code: currency_code, data: data }
    Parser.get(type).new(props)
  end
end
