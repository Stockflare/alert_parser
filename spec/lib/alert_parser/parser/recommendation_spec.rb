module AlertParser
  describe Parser::Recommendation do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, upgraded: [true, false].sample, recommendation_text: %w(buy sell strong_buy strong_sell hold).sample } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::Recommendation.new(properties) }

    it { should respond_to(:recommendation_text) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { parser.messages.values.each { |m| expect(m).to include(data[:short_name]) } }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq data[:upgraded] }
    end

    describe '#recommendation_text' do
      let(:value) { data[:recommendation_text] }

      

      subject { parser.recommendation_text(value, locale) }

      it { should be_a String }

      it { should match /(Buy|Hold|Sell|Strong Buy|Strong Sell)/ }

      describe '#messages' do
        before { allow(parser).to receive(:recommendation_text).and_return(subject) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } }
      end
    end
  end
end
