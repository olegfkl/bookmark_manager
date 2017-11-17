feature 'can sign up' do
  scenario 'gives username and password' do
    sign_up
    expect(page).to have_content('Hello, oleg@oleg.com')
  end

  scenario 'adds to user count' do
    expect { sign_up }.to change { User.all.count }.by(1)
  end

  scenario 'goes to links page' do
    sign_up
    expect(page.current_path).to eq '/links'
  end
end
