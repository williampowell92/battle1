require_relative '../../app.rb'

describe Battle, type: :feature do

  context 'At the beginning...' do
    let(:name_1) { 'Bob' }
    let(:name_2) { 'Karen' }

    it 'Presents text to user' do
      visit '/'
      expect(page).to have_content 'Testing infrastructure working!'
    end
    it 'Should allow players to enter their names' do
      visit '/'
      fill_in 'player_name_1', with: name_1
      fill_in 'player_name_2', with: name_2
      click_button('Play')
      expect(page).to have_content "#{name_1} V #{name_2}"
    end
  end
end
