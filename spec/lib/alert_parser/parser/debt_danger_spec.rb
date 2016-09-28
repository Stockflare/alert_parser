module AlertParser
  describe Parser::DebtDanger do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, positive: [true, false].sample, net_debt_to_operating_profit: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::DebtDanger.new(properties) }

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

    describe '#net_debt_to_operating_profit' do
      let(:value) { 123456789.123456789 }





      subject { parser.net_debt_to_operating_profit(value, locale) }

      it { should be_a String }

      it { should eq "123,456,789.1x" }

      describe '#message' do
        before { allow(parser).to receive(:net_debt_to_operating_profit).and_return(subject) }

        specify { expect(parser.message).to include(subject) }
      end
    end
  end
end
