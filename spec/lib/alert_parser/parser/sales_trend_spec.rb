module AlertParser
  describe Parser::SalesTrend do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, rising: [true, false].sample } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::SalesTrend.new(properties) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { expect(parser.message).to include(data[:short_name]) }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq data[:rising] }
    end
  end
end
