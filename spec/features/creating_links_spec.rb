require 'capybara/rspec'
require './app/models/link.rb'

feature 'Button to add a new link' do
  scenario 'The link\'s page has a button to add a new link' do
   visit('/links')
   expect(page).to have_button "Add new link"
  end
end

feature 'Click on \'add new link\' to display a form' do
  scenario 'Add new link takes you to a new page with form' do
   visit('/links')
   click_button 'Add new link'
   expect(page).to have_content "URL"
  end
end

# feature 'Fill in the form to add a new link to database' do
#   scenario 'After filling in the form the link gets added to the list' do
#   end
# end
