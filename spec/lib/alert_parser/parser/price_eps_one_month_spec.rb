module AlertParser
  describe Parser::PriceEpsOneMonth do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, price_change_one_month: rand(Math::E..Math::PI), forecast_eps_change_one_month: rand(Math::E..Math::PI), forecast_pe: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::PriceEpsOneMonth.new(properties) }

    it { should respond_to(:price_change_one_month) }

    it { should respond_to(:forecast_eps_change_one_month) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { expect(parser.message).to include(data[:short_name]) }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq true }
    end

    describe '#price_change_one_month' do
      let(:value) { 123456789.123456789 }



      subject { parser.price_change_one_month(value, locale) }

      it { should be_a String }

      it { should eq "12,345,678,912.3%" }

      describe '#message' do
        before { allow(parser).to receive(:price_change_one_month).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end

    describe '#forecast_eps_change_one_month' do
      let(:value) { 123456789.123456789 }





      subject { parser.forecast_eps_change_one_month(value, locale) }

      it { should be_a String }

      it { should eq "123,456,789.1%" }

      describe '#message' do
        before { allow(parser).to receive(:forecast_eps_change_one_month).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end
  end
end
