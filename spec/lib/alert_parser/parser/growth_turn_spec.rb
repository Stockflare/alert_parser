module AlertParser
  describe Parser::GrowthTurn do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, timestamp: Time.now.utc.to_i, positive: [true, false].sample, long_term_growth: rand(Math::E..Math::PI), long_term_growth_yesterday: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::GrowthTurn.new(properties) }

    it { should respond_to(:long_term_growth) }

    it { should respond_to(:long_term_growth_yesterday) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { parser.messages.values.each { |m| expect(m).to include(data[:short_name]) } }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq data[:long_term_growth] > data[:long_term_growth_yesterday] }

      specify { expect([true, false]).to include subject }
    end

    describe '#long_term_growth' do
      let(:value) { 123456789.123456789 }



      subject { parser.long_term_growth(value, locale) }

      it { should be_a String }

      it { should eq "123,456,789.12%" }

      describe '#messages' do
        before { allow(parser).to receive(:long_term_growth).and_return(subject) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } }
      end
    end

    describe '#long_term_growth_yesterday' do
      let(:value) { 123456789.123456789 }



      subject { parser.long_term_growth_yesterday(value, locale) }

      it { should be_a String }

      it { should eq "123,456,789.12%" }

      describe '#messages' do
        before { allow(parser).to receive(:long_term_growth).and_return(subject) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } }
      end
    end

    describe '#timestamp' do
      let(:days) { %w(sunday monday tuesday wednesday thursday friday saturday) }

      let(:value) { Time.now.utc.to_i }



      subject { parser.timestamp(value, locale) }

      it { should be_a String }

      specify { expect(subject.downcase).to eq days[Time.at(value).wday] }

      describe '#messages' do
        before { allow(parser).to receive(:timestamp).and_return(subject) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } }
      end
    end
  end
end
