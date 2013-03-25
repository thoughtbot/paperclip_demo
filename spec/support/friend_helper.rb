def add_friend_with_image(name, image)
  visit root_path
  click_link 'New Friend'
  fill_in 'Name', with: name
  attach_file 'Avatar', image
  click_button 'Make a friend'
end

def add_friend_without_image(name)
  visit root_path
  click_link 'New Friend'
  fill_in 'Name', with: name
  click_button 'Make a friend'
end
