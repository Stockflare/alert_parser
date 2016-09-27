module AlertParser
  module Parser
    autoload :Base, 'alert_parser/parser/base'
    autoload :Cash, 'alert_parser/parser/cash'
    autoload :Consolidation, 'alert_parser/parser/consolidation'
    autoload :DebtDanger, 'alert_parser/parser/debt_danger'
    autoload :DebtNet, 'alert_parser/parser/debt_net'
    autoload :DpsGrowth, 'alert_parser/parser/dps_growth'
    autoload :DpsTrend, 'alert_parser/parser/dps_trend'
    autoload :DpsTurn, 'alert_parser/parser/dps_turn'
    autoload :DpsWarning, 'alert_parser/parser/dps_warning'
    autoload :EpsGrowth, 'alert_parser/parser/eps_growth'
    autoload :EpsPriceOneMonth, 'alert_parser/parser/eps_price_one_month'
    autoload :EpsPriceOneWeek, 'alert_parser/parser/eps_price_one_week'
    autoload :EpsTrend, 'alert_parser/parser/eps_trend'
    autoload :EpsTurn, 'alert_parser/parser/eps_turn'
    autoload :GainTrend, 'alert_parser/parser/gain_trend'
    autoload :GainTurn, 'alert_parser/parser/gain_turn'
    autoload :GrowthTrend, 'alert_parser/parser/growth_trend'
    autoload :GrowthTurn, 'alert_parser/parser/growth_turn'
    autoload :Pe, 'alert_parser/parser/pe'
    autoload :PriceEpsOneMonth, 'alert_parser/parser/price_eps_one_month'
    autoload :PriceEpsOneWeek, 'alert_parser/parser/price_eps_one_week'
    autoload :PriceIntraday, 'alert_parser/parser/price_intraday'
    autoload :PriceLargeCap, 'alert_parser/parser/price_large_cap'
    autoload :PricePeer, 'alert_parser/parser/price_peer'
    autoload :PriceSmallCap, 'alert_parser/parser/price_small_cap'
    autoload :Recommendation, 'alert_parser/parser/recommendation'
    autoload :SalesTrend, 'alert_parser/parser/sales_trend'
    autoload :Split, 'alert_parser/parser/split'
    autoload :StarsPeers, 'alert_parser/parser/stars_peers'
    autoload :Stars, 'alert_parser/parser/stars'
    autoload :TargetTrend, 'alert_parser/parser/target_trend'
    autoload :TargetTurn, 'alert_parser/parser/target_turn'
    autoload :VolumeTenDay, 'alert_parser/parser/volume_ten_day'

    def self.get(name)
      call(camelize(name))
    end

    def self.all
      constants.sort_by! { |m| m.downcase } - %i(Base)
    end

    def self.index(name)
      get(name).const_get(:INDEX)
    end

    def self.call(pub)
      const_get(pub.to_sym)
    end

    private

    def self.camelize(term)
      string = term.to_s
      string = string.sub(/^[a-z\d]*/) { $&.capitalize }
      string.gsub!(/(?:_|(\/))([a-z\d]*)/i) { "#{$1}#{$2.capitalize}" }
      string.gsub!(/\//, '::')
      string
    end
  end
end
