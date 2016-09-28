module AlertParser
  describe Parser::GainTrend do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, positive: [true, false].sample, long_term_gain: rand(Math::E..Math::PI), long_term_gain_one_week_ago: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::GainTrend.new(properties) }

    it { should respond_to(:long_term_gain) }

    it { should respond_to(:long_term_gain_one_week_ago) }

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

    describe '#long_term_gain' do
      let(:value) { 123456789.123456789 }



      subject { parser.long_term_gain(value, locale) }

      it { should be_a String }

      it { should eq "12,345,678,912.35%" }

      describe '#message' do
        before { allow(parser).to receive(:long_term_gain).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end

    describe '#long_term_gain_one_week_ago' do
      let(:value) { 123456789.123456789 }



      subject { parser.long_term_gain_one_week_ago(value, locale) }

      it { should be_a String }

      it { should eq "12,345,678,912.35%" }

      describe '#message' do
        before { allow(parser).to receive(:long_term_gain).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end
  end
end
