def create_tagged_link(tag)
  visit('/links/new')
  fill_in('title', with: 'example')
  fill_in('url', with: 'example.com')
  fill_in('tag', with: tag)
  click_button('Submit')
end

feature 'can filter by tags' do
  scenario 'searching for bubble tags' do
    4.times { create_tagged_link('bubble') }
    3.times { create_tagged_link('nil') }
    visit('/tags/bubble')
    expect(page.all('li').count).to eq 4
  end
end
