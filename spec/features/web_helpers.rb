def create_tagged_link(title, url, tag)
  visit('/links/new')
  fill_in('title', with: title)
  fill_in('url', with: url)
  fill_in('tag', with: tag)
  click_button('Submit')
end
