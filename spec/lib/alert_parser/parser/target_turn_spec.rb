module AlertParser
  describe Parser::TargetTurn do

    let(:locale) { Locale.new(language: 'en') }

    let(:currency_code) { 'usd' }

    let(:data) { { short_name: Faker::Company.name, rising: [true, false].sample, target_price: rand(Math::E..Math::PI), price: rand(Math::E..Math::PI) } }

    let(:properties) { { locale: locale, currency_code: currency_code, data: data } }

    subject(:parser) { Parser::TargetTurn.new(properties) }

    it { should respond_to(:target_price) }

    it { should respond_to(:price) }

    it_behaves_like 'a parser class'







    specify { expect { subject.positive? }.to_not raise_error }

    describe '%short_name interpolation' do
      specify { parser.messages.values.each { |m| expect(m).to include(data[:short_name]) } }
    end

    describe '#positive?' do
      subject { parser.positive? }

      specify { expect(subject).to eq data[:rising] }

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

    describe '#price' do
      let(:value) { 123456789.123456789 }

      

      

      subject { parser.price(value, locale) }

      it { should be_a String }

      it { should eq "$123,456,789.12" }

      describe '#messages' do
        before { allow(parser).to receive(:target_price).and_return(subject) }

        specify { parser.messages.values.each { |m| expect(m).to include(subject) } }
      end
    end
  end
end
