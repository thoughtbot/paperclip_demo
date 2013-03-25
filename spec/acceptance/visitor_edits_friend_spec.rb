require 'spec_helper'

feature 'visitor edits a friend' do
  scenario 'successful edit' do
    add_friend_with_image('Mona Lisa', 'spec/support/mona_lisa.jpg')
    edit_friend

    expect(page).to have_text('Friend was successfully updated.')
  end

  def edit_friend
    visit friends_path
    click_link 'Edit'
    fill_in 'Name', with: 'Mary Lisa'
    click_button 'Make a friend'
  end
end
