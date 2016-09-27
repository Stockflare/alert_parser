module AlertParser
  describe Parser::DebtNet do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, positive: [true, false].sample, net_cash_to_share_price: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    it { should respond_to(:net_cash_to_share_price) }

    subject(:parser) { Parser::DebtNet.new(properties) }

    it_behaves_like 'a parser class'





    specify { expect { subject.positive? }.to_not raise_error }



    describe '%short_name interpolation' do
      specify { parser.messages.values.each { |m| expect(m).to include(data[:short_name]) } }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq data[:positive] }

      specify { expect([true, false]).to include subject }
    end

    describe '#net_cash_to_share_price' do
      let(:value) { 123456789.123456789 }



      subject { parser.net_cash_to_share_price(value, locale) }

      it { should be_a String }

      it { should eq "123,456,789.12%" }

      describe '#messages' do
        before { allow(parser).to receive(:net_cash_to_share_price).and_return(subject) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } if parser.positive? }
      end
    end
  end
end
