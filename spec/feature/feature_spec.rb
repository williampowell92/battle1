require_relative '../../app.rb'

feature Battle do
  let(:name_1) { 'Bob' }
  let(:name_2) { 'Karen' }
  let(:normal_hit_points) { 50 }

  feature 'To set-up the game' do
    scenario 'Should allow players to enter their names' do
      sign_in_and_play
      expect(page).to have_content "#{name_1} V #{name_2}"
    end
  end

  feature 'When the game is ready to go' do
    scenario "Should display Player 2's hitpoints" do
      sign_in_and_play
      expect(page).to have_content "#{name_2} hit points: #{normal_hit_points}"
    end
  end

  feature 'when attacking player' do
    scenario 'should get confirmation' do
      sign_in_and_play
      click_link('Nipple Cripple')
      expect(page).to have_content('You squeezed them raw!')
    end
  end
end
