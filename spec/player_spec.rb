describe Player do

  let(:name) { 'Goku' }
  let(:default_health) { described_class::DEFAULT_HEALTH }
  subject { described_class.new(name) }
  let(:player) { double :player, decrease_health: nil }

  describe '#name' do
    it "returns the name" do
      expect(subject.name).to eq name
    end
  end

  describe '#health' do
    it 'starts with 50' do
      expect(subject.health).to eq default_health
    end
  end

  describe '#decrease_health' do
    it 'decreases by 10' do
      subject.decrease_health
      expect(subject.health).to eq 40
    end
  end

  describe '#attack' do
    it 'calls reduce_health on argument' do
      subject.attack(player)
      expect(player).to have_received(:decrease_health)
    end
  end

end
