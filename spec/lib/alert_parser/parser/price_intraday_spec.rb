module AlertParser
  describe Parser::PriceIntraday do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, price_change: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::PriceIntraday.new(properties) }

    it { should respond_to(:price_change) }

    it_behaves_like 'a parser class'

    specify { expect(subject.name).to eq 'price_intraday' }







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { parser.messages.values.each { |m| expect(m).to include(data[:short_name]) } }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq data[:price_change] > 0 }
    end

    describe '#price_change' do
      let(:value) { 123456789.123456789 }



      subject { parser.price_change(value, locale) }

      it { should be_a String }

      it { should eq "123,456,789.1%" }

      describe '#messages' do
        before { allow(parser).to receive(:price_change).and_return(subject) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } }
      end
    end
  end
end
