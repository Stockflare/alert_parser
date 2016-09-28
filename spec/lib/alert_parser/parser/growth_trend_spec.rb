module AlertParser
  describe Parser::GrowthTrend do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, positive: [true, false].sample, long_term_growth: rand(Math::E..Math::PI), long_term_growth_one_week_ago: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::GrowthTrend.new(properties) }

    it { should respond_to(:long_term_growth) }

    it { should respond_to(:long_term_growth_one_week_ago) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { expect(parser.message).to include(data[:short_name]) }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq data[:long_term_growth] > data[:long_term_growth_one_week_ago] }

      specify { expect([true, false]).to include subject }
    end

    describe '#long_term_growth' do
      let(:value) { 123456789.123456789 }



      subject { parser.long_term_growth(value, locale) }

      it { should be_a String }

      it { should eq "123,456,789.12%" }

      describe '#message' do
        before { allow(parser).to receive(:long_term_growth).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end

    describe '#long_term_growth_one_week_ago' do
      let(:value) { 123456789.123456789 }



      subject { parser.long_term_growth_one_week_ago(value, locale) }

      it { should be_a String }

      it { should eq "123,456,789.12%" }

      describe '#message' do
        before { allow(parser).to receive(:long_term_growth).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end
  end
end
