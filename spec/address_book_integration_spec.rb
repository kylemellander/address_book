require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe("/", {:type => :feature}) do
  it('loads the front page') do
    visit('/')
    expect(page).to have_content("Address Book")
  end

  it('displays contact added to front page') do
    visit('/')
    fill_in('first_name', :with => "Justin")
    fill_in('last_name', :with => "Scott")
    click_button('Add Contact')
    click_link('Address Book')
    expect(page).to have_content("Justin Scott")
  end

  it('displays contact info on contact page after contact is created') do
    visit('/')
    fill_in('first_name', :with => "Justin")
    fill_in('last_name', :with => "Scott")
    click_button('Add Contact')
    expect(page).to have_content("Justin Scott")
  end
end
