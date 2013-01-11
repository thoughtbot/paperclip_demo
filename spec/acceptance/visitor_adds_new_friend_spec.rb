require 'spec_helper'

feature 'visitor adds a new friend' do
  scenario 'add friend with image' do
    visit root_path
    click_link 'New Friend'
    fill_in 'Name', with: 'Mona Lisa'
    attach_file 'Avatar', Rails.root.join('spec', 'support', 'mona_lisa.jpg')
    click_button 'Make a friend'

    page.should have_css('h2', text: 'Mona Lisa')
    page.should have_xpath("//img[contains(@src, 'mona_lisa.jpg')]")
  end

  scenario 'add friend without image' do
    visit root_path
    click_link 'New Friend'
    fill_in 'Name', with: 'Mona Lisa'
    click_button 'Make a friend'

    page.should have_css('h2', text: 'Mona Lisa')
    page.should have_xpath("//img[contains(@src, 'missing.png')]")
  end
end
