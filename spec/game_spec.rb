describe Game do
  let(:player) { instance_double Player, decrease_health: nil }

  describe '#attack' do
    it 'calls reduce_health on argument' do
      subject.attack(player)
      expect(player).to have_received(:decrease_health)
    end
  end
end
