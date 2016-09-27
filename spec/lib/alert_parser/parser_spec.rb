module AlertParser
  describe Parser do
    it { should respond_to(:all) }

    it { should respond_to(:call) }

    it { should respond_to(:get) }

    it { should respond_to(:index) }

    describe '#index' do
      let(:const) { Parser.all.sample }

      subject { Parser.index(const) }

      it { should be_a Fixnum }

      it { should be >= 700 }

      it { should be <= 800 }

      it { should be <= Parser.all.count }
    end

    describe '#index underscored' do
      let(:const) { 'volume_ten_day' }

      subject { Parser.index(const) }

      it { should be_a Fixnum }

      it { should be > 0 }

      it { should be <= Parser.all.count }
    end

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
