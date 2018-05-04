feature 'Losing the game' do
  scenario 'Displays Player Lost' do
    sign_in_and_play
    9.times do
      click_on(class: 'button titan-one')
      click_link('Release the Nips')
    end
    expect(page).to have_content 'Karen Lost'
  end
end