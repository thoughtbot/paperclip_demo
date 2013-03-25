require 'spec_helper'

feature 'visitor adds a new friend' do
  scenario 'with image' do
    add_friend_with_image('Mona Lisa', 'spec/support/mona_lisa.jpg')

    expect(page).to have_css('h2', text: 'Mona Lisa')
    expect(page).to have_xpath("//img[contains(@src, 'mona_lisa.jpg')]")
  end

  scenario 'without image' do
    add_friend_without_image('Mona Lisa')

    expect(page).to have_css('h2', text: 'Mona Lisa')
    expect(page).to have_xpath("//img[contains(@src, 'missing.png')]")
  end
end
