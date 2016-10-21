require 'yaml'

module AlertParser
  module Parser
    class Base
      attr_reader :locale, :currency_code, :data

      def initialize(locale: nil, currency_code: 'usd', data: {})
        @locale = locale
        @currency_code = currency_code
        # ensure data keys are symbols
        # @data = Hash[data.collect { |k,v| [k.to_sym, v ? YAML.load(v) : nil] }]
        @data = parse_hash(data)
      end

      def parse_hash(input)
        out = {}
        input.each do |k, v|
          out_v = v
          case v.class.name
          when 'String'
            out_v = YAML.load(v)
          when 'Hash'
            out_v = parse_hash(v)
          end
          out[k.to_sym] = out_v
        end
        out
      end

      def attitude
        @attitude ||= positive? ? 'positive' : 'negative'
      end

      def currency(locale, value, dp = 2)
        locale.format_currency(currency_code, value)
      end

      def message
        interpolate(translation, locale)
      end

      def translation
        locale.translations['notifications'][name][attitude]
      end

      def name
        self.class.name.split(/::/).last.tap { |s| s.gsub!(/(.)([A-Z])/,'\1_\2') }.downcase!
      end

      def positive?
        fail new NotImplementedError.new("missing #positive? definition on #{name}")
      end

      private

      def interpolate(message, locale)
        data.each do |key, value|
          interpolate = respond_to?(key) ? send(key, value, locale) : value.to_s
          message = message.gsub(/%#{key}([^_a-z]|$)/, interpolate + '\1')
        end
        message
      end
    end
  end
end
