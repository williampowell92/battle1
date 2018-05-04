feature 'switching turns' do
  scenario 'switching turns' do
    sign_in_and_play
    click_on(class: 'button titan-one')
    click_link('Release the Nips')
    click_on(class: 'button titan-one')
    click_link('Release the Nips')
    expect(page).to have_content 'Bob hit points: 40'
  end
end