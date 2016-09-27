module AlertParser
  shared_examples 'a parser class' do
    it { should respond_to(:attitude) }

    it { should respond_to(:messages) }

    it { should respond_to(:positive?) }

    it { should respond_to(:currency) }

    it { should respond_to(:name) }

    it { should respond_to(:locale) }

    it { should respond_to(:currency_code) }

    it { should respond_to(:data) }

    specify { expect(subject.locale).to be_an_instance_of Locale }

    specify { expect(subject.data).to be_a Hash }

    specify { expect(subject.currency_code).to be_a String }

    specify { expect(subject.data).to_not be_empty }

    specify { expect(Parser.get(subject.name)).to be_a Class }

    specify { expect { Parser.get(subject.name) }.to_not raise_error }

    specify { expect { subject.positive? }.to_not raise_error }

    specify { expect([true, false]).to include subject.positive? }

    specify { expect(%w(positive negative)).to include subject.attitude }

    describe '#name' do
      specify { expect(subject.name).to be_a String }

      specify { expect(subject.name).to_not be_empty }

      specify { expect(subject.name).to_not match /[a-z][A-Z]/ }

      specify { expect(subject.name).to match /^[_a-z]+$/ }
    end

    describe '#messages' do
      specify { expect(subject.messages).to be_a Hash }

      specify { expect(subject.messages).to_not be_empty }

      specify { subject.messages.keys.each { |k| expect(k).to be_a String } }

      specify { subject.messages.values.each { |m| expect(m).to be_a String } }

      specify { subject.messages.values.each { |m| expect(m).to_not match /\%[_a-zA-Z0-9]+/ } }

      specify { subject.messages.keys.each { |k| expect(k).to match /^[a-z]{2}$/ } }
    end

    describe '#currency' do
      let(:value) { 123456789.123456789 }

      specify { expect(subject.currency(subject.locale, value)).to eq "$123,456,789.12" }
    end
  end
end
