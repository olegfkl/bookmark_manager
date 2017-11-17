feature 'can filter by tags' do
  scenario 'searching for bubble tags' do
    4.times { create_tagged_link('Bubble', 'bubble.com', 'bubble') }
    3.times { create_tagged_link('Nil', 'nil.com', 'nil') }
    visit('/tags/bubble')
    expect(page.all('li').count).to eq 4
  end
end
