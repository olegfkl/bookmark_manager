require 'capybara/rspec'

feature "List of links on homepage" do
  scenario 'When i\'m visiting a home page I get a list of my links ' do
      Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      visit('/links')

      # this is a *temporary* sanity check - to make sure we
      # can load the page 
      expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content "Makers Academy"
  end
end
