describe Player do

  let(:name) { 'Goku' }
  subject { described_class.new(name) }

  describe '#name' do
    it "returns the name" do
      expect(subject.name).to eq name
    end
  end

end
