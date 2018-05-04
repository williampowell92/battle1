describe Game, :game do
  subject { described_class.instance }
  let(:player) { double :player, decrease_health: nil }
  let(:another_player) { double :another_player, decrease_health: nil}

  before do
    subject.instance_variable_set(:@turn, 0)
    subject.player1 = player
    subject.player2 = another_player
  end

  describe '#attack' do
    it 'calls reduce_health on argument' do
      subject.attack
      expect(another_player).to have_received(:decrease_health)
    end

    it 'changes which player attacks' do
      subject.attack
      subject.attack
      expect(player).to have_received(:decrease_health)
    end
  end

  describe '#initialize' do
    it 'saves player 1' do
      expect(subject.instance_variable_get(:@player1)).to eq player
    end
  end

  describe '#player1' do
    it 'can read player1' do
      expect(subject.player1).to eq player
    end
  end

  describe '#player2' do
    it 'can read player2' do
      expect(subject.player2).to eq another_player
    end
  end

  describe '#attacker' do
    it 'starts as player 1' do
      p subject
      expect(subject.attacker).to eq player
    end

    it 'changes to player 2 after attack' do
      subject.attack
      expect(subject.attacker).to eq another_player
    end
  end

  describe '#victim' do
    it 'starts as player 2' do
      expect(subject.victim).to eq another_player
    end

    it 'changes to player 1 after attack' do
      subject.attack
      expect(subject.victim).to eq player
    end
  end

  describe '#instance' do
    it 'creates an instance of itself' do
      expect(described_class.instance).to be_an_instance_of described_class
    end
  end
end
