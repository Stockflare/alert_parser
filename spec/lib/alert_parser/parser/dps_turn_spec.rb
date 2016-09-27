module AlertParser
  describe Parser::DpsTurn do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, forecast_dps: rand(Math::E..Math::PI), forecast_dps_yesterday: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::DpsTurn.new(properties) }

    it { should respond_to(:forecast_dps) }

    it { should respond_to(:forecast_dps_yesterday) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { parser.messages.values.each { |m| expect(m).to include(data[:short_name]) } }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq data[:forecast_dps] > data[:forecast_dps_yesterday] }

      specify { expect([true, false]).to include subject }
    end

    describe '#forecast_dps' do
      let(:value) { 123456789.123456789 }

      

      

      subject { parser.forecast_dps(value, locale) }

      it { should be_a String }

      it { should eq "$123,456,789.12" }

      describe '#messages' do
        before { allow(parser).to receive(:forecast_dps).and_return(subject) }

        before { allow(parser).to receive(:positive?).and_return(true) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } }
      end
    end

    describe '#forecast_dps_yesterday' do
      let(:value) { 123456789.123456789 }

      

      

      subject { parser.forecast_dps_yesterday(value, locale) }

      it { should be_a String }

      it { should eq "$123,456,789.12" }

      describe '#messages' do
        before { allow(parser).to receive(:forecast_dps).and_return(subject) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } if parser.positive? }
      end
    end
  end
end
