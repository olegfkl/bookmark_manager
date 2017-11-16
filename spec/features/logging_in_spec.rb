def sign_in
  visit('/signup')
  fill_in('username', with: 'oleg@oleg.com')
  fill_in('password', with: 'gelo')
  click_button('Submit')
end

feature 'can sign up' do
  scenario 'gives username and password' do
    sign_in
    expect(page).to have_content('Hello, oleg@oleg.com')
  end

  scenario 'adds to user count' do
    expect { sign_in }.to change { User.all.count }.by(1)
  end

  scenario 'goes to links page' do
    sign_in
    expect(page.current_path).to eq '/links'
  end
end
