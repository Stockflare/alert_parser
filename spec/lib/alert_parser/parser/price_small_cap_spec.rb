module AlertParser
  describe Parser::PriceSmallCap do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, timestamp: Time.now.utc.to_i, price_change: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::PriceSmallCap.new(properties) }

    it { should respond_to(:price_change) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { expect(parser.message).to include(data[:short_name]) }
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

      describe '#message' do
        before { allow(parser).to receive(:price_change).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end

    describe '#timestamp' do
      let(:days) { %w(sunday monday tuesday wednesday thursday friday saturday) }

      let(:value) { Time.now.utc.to_i }



      subject { parser.timestamp(value, locale) }

      it { should be_a String }

      specify { expect(subject.downcase).to eq days[Time.at(value).wday] }

      describe '#message' do
        before { allow(parser).to receive(:timestamp).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end
  end
end
