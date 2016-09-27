module AlertParser
  describe Parser::EpsTrend do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, forecast_eps: rand(Math::E..Math::PI), forecast_eps_one_week_ago: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::EpsTrend.new(properties) }

    it { should respond_to(:forecast_eps) }

    it { should respond_to(:forecast_eps_one_week_ago) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { parser.messages.values.each { |m| expect(m).to include(data[:short_name]) } }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq data[:forecast_eps] > data[:forecast_eps_one_week_ago] }

      specify { expect([true, false]).to include subject }
    end

    describe '#forecast_eps' do
      let(:value) { 123456789.123456789 }

      

      

      subject { parser.forecast_eps(value, locale) }

      it { should be_a String }

      it { should eq "$123,456,789.12" }

      describe '#messages' do
        before { allow(parser).to receive(:forecast_eps).and_return(subject) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } }
      end
    end

    describe '#forecast_eps_one_week_ago' do
      let(:value) { 123456789.123456789 }

      

      

      subject { parser.forecast_eps_one_week_ago(value, locale) }

      it { should be_a String }

      it { should eq "$123,456,789.12" }

      describe '#messages' do
        before { allow(parser).to receive(:forecast_eps).and_return(subject) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } }
      end
    end
  end
end
