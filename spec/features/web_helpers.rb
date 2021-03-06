def create_tagged_link(title, url, tag)
  visit('/links/new')
  fill_in('title', with: title)
  fill_in('url', with: url)
  fill_in('tag', with: tag)
  click_button('Submit')
end

def sign_up
  visit('/users/new')
  fill_in('email', with: 'oleg@oleg.com')
  fill_in('password', with: 'gelo')
  fill_in('password_confirmation', with: 'gelo')
  click_button('Submit')
end

def sign_up_mismatch_password
  visit('/users/new')
  fill_in('email', with: 'oleg@oleg.com')
  fill_in('password', with: 'gelo')
  fill_in('password_confirmation', with: 'gelo123')
  click_button('Submit')
end
