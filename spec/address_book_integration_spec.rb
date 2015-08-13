require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe("/", {:type => :feature}) do
  before() do
    Contact.clear()
    Phone.clear()
    Address.clear()
    Email.clear()
  end

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

  it('Adds phone number to contact and continues to display contact') do
    visit('/')
    fill_in('first_name', :with => "Justin")
    fill_in('last_name', :with => "Scott")
    click_button('Add Contact')
    fill_in('phone_type', :with => "Home")
    fill_in('phone_number', :with => "503-555-5555")
    click_button('Add Phone Number')
    expect(page).to have_content("503-555-5555")
  end

end
