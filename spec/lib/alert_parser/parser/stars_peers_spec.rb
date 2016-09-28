module AlertParser
  describe Parser::StarsPeers do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:rics) { Array.new(rand(1..5)).collect { ('A'..'Z').to_a.sample(rand(2..4)).join }.join(', ') }

    let(:data) { { short_name: Faker::Company.name, rating: rand(1..3), rics: rics } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::StarsPeers.new(properties) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { expect(parser.message).to include(data[:short_name]) }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq false }
    end

    describe '%short_name interpolation' do
      specify { expect(parser.message).to include(data[:short_name]) }
    end

    describe '%rics interpolation' do
      specify { expect(parser.message).to include(data[:rics].upcase) }
    end
  end
end
