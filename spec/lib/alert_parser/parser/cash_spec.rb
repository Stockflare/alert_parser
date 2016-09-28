module AlertParser
  describe Parser::Cash do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, increase: [true, false].sample, net_cash_to_share_price: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::Cash.new(properties) }

    it { should respond_to(:net_cash_to_share_price) }

    it_behaves_like 'a parser class'

    specify { expect { subject.positive? }.to_not raise_error }

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq data[:increase] }

      specify { expect([true, false]).to include subject }
    end

    describe '%short_name interpolation' do
      specify { expect(parser.message).to include(data[:short_name]) }
    end

    describe '#net_cash_to_share_price' do
      let(:value) { 123456789.123456789 }

      subject { parser.net_cash_to_share_price(value, locale) }

      it { should be_a String }

      it { should eq "12,345,678,912.35%" }

      describe '#message' do
        before { allow(parser).to receive(:net_cash_to_share_price).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end
  end
end
