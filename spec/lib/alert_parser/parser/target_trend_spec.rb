module AlertParser
  describe Parser::TargetTrend do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, target_price: rand(Math::E..Math::PI), target_price_one_week_ago: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::TargetTrend.new(properties) }

    it { should respond_to(:target_price) }

    it { should respond_to(:target_price_one_week_ago) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { parser.messages.values.each { |m| expect(m).to include(data[:short_name]) } }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq data[:target_price] > data[:target_price_one_week_ago] }

      specify { expect([true, false]).to include subject }
    end

    describe '#target_price' do
      let(:value) { 123456789.123456789 }

      

      

      subject { parser.target_price(value, locale) }

      it { should be_a String }

      it { should eq "$123,456,789.12" }

      describe '#messages' do
        before { allow(parser).to receive(:target_price).and_return(subject) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } }
      end
    end

    describe '#target_price_one_week_ago' do
      let(:value) { 123456789.123456789 }

      

      

      subject { parser.target_price_one_week_ago(value, locale) }

      it { should be_a String }

      it { should eq "$123,456,789.12" }

      describe '#messages' do
        before { allow(parser).to receive(:target_price).and_return(subject) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } }
      end
    end
  end
end
