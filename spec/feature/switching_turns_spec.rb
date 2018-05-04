feature 'switching turns' do
  scenario 'switching turns' do
    sign_in_and_play
    click_on(class: 'button titan-one')
    click_link('Release the Nips')
    click_on(class: 'button titan-one')
    click_link('Release the Nips')
    expect(page).to have_content 'Bob hit points: 40'
  end

  scenario 'shows whose turn it is on /play' do
    sign_in_and_play
    expect(page).to have_content "Bob's turn"
  end

  scenario 'shows next players turn' do
    sign_in_and_play
    click_on(class: 'button titan-one')
    click_link('Release the Nips')
    expect(page).to have_content "Karen's turn"
  end
end
