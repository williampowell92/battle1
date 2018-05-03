require_relative '../../app.rb'

describe Battle, type: :feature do
  let(:name_1) { 'Bob' }
  let(:name_2) { 'Karen' }
  let(:normal_hit_points) { 50 }

  context 'To set-up the game' do
  
    it 'Should allow players to enter their names' do
      sign_in_and_play
      expect(page).to have_content "#{name_1} V #{name_2}"
    end
  end

  context 'When the game is ready to go' do
    it "Should display Player 2's hitpoints" do
      sign_in_and_play
      expect(page).to have_content "#{name_2} hit points: #{normal_hit_points}"
    end
  end
end
