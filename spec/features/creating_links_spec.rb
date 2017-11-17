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
   expect(page).to have_content "Title"
  end
end

feature 'Fill in the form to add a new link to database' do
  scenario 'After filling in the form the link gets added to the list' do
    create_tagged_link('Test', 'www', 'google')
    expect(current_path).to eq '/links'
    within 'ul#links' do
    expect(page).to have_content 'Test'
    expect(page).to have_content 'google'
    end
  end
end

feature 'Fill in the form to add a new link to database' do
  scenario 'After filling in the form the link gets added to the list' do
    create_tagged_link('Test', 'www', 'google example1 example2')
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(Tag.all.length).to eq 3
      expect(page).to have_content 'Test'
      expect(page).to have_content 'google example1 example2'
    end
  end
end
