module AlertParser
  describe Parser do
    it { should respond_to(:all) }

    it { should respond_to(:call) }

    it { should respond_to(:get) }

    describe '#all' do
      subject { Parser.all }

      it { should be_a Array }

      it { should_not be_empty }

      it { should_not include Parser::Base }
    end

    describe '#get' do
      let(:parser) { 'stars' }

      subject { Parser.get(parser) }

      it { should eq Parser::Stars }
    end
  end
end
