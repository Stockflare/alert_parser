module AlertParser
  describe AlertParser do
    let(:language) { 'en' }

    let(:currency_code) { 'usd' }

    let(:alert) { 'cash' }

    let(:data) { { short_name: Faker::Company.name, increase: [true, false].sample, net_cash_to_share_price: rand(Math::E..Math::PI) } }

    specify { expect { AlertParser.parse(alert, language, currency_code, data) }.to_not raise_error }

    describe 'return result' do
      let(:parser) { AlertParser.parse(alert, language, currency_code, data) }

      subject { parser.message }

      it { should be_a String }
    end
  end
end
