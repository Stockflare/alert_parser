module AlertParser
  describe Parser::DpsWarning do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, forecast_eps: rand(Math::E..Math::PI), forecast_dps: rand(Math::E..Math::PI), positive: false } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::DpsWarning.new(properties) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { expect(parser.message).to include(data[:short_name]) }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq data[:positive] }

      specify { expect([true, false]).to include subject }
    end

    describe '#forecast_dps' do
      let(:value) { 123456789.123456789 }

      

      

      subject { parser.forecast_dps(value, locale) }

      it { should be_a String }

      it { should eq "$123,456,789.12" }

      describe '#message' do
        before { allow(parser).to receive(:forecast_dps).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end

    describe '#forecast_eps' do
      let(:value) { 123456789.123456789 }

      

      

      subject { parser.forecast_eps(value, locale) }

      it { should be_a String }

      it { should eq "$123,456,789.12" }

      describe '#message' do
        before { allow(parser).to receive(:forecast_eps).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end
  end
end
