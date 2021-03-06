module AlertParser
  describe Parser::Split do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, timestamp: Time.now.utc.to_i, price: rand(Math::E..Math::PI), price_yesterday: rand(Math::E..Math::PI), ratio: rand(Math::E..Math::PI), split_date: Time.now.utc.to_i } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::Split.new(properties) }

    it { should respond_to(:price) }

    it { should respond_to(:price_yesterday) }

    it { should respond_to(:ratio) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { expect(parser.message).to include(data[:short_name]) }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq true }
    end

    describe '#split_date' do
      let(:value) { Time.now.utc.to_i }



      subject { parser.split_date(value, locale) }

      it { should be_a String }

      it { should eq Time.now.utc.strftime('%Y-%m-%d') }

      describe '#message' do
        before { allow(parser).to receive(:split_date).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end

    describe '#ratio' do
      let(:value) { 123456789.123456789 }



      subject { parser.ratio(value, locale) }

      it { should be_a String }

      it { should eq "123456789.1" }

      describe '#message' do
        before { allow(parser).to receive(:ratio).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end

    describe '#price' do
      let(:value) { 123456789.123456789 }





      subject { parser.price(value, locale) }

      it { should be_a String }

      it { should eq "$123,456,789.12" }

      describe '#message' do
        before { allow(parser).to receive(:price).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end

    describe '#price_yesterday' do
      let(:value) { 123456789.123456789 }





      subject { parser.price_yesterday(value, locale) }

      it { should be_a String }

      it { should eq "$123,456,789.12" }

      describe '#message' do
        before { allow(parser).to receive(:price_yesterday).and_return(subject) }

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
