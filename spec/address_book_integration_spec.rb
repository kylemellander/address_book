require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe("/", {:type => :feature}) do
  it('loads the front page') do
    visit('/')
    expect(page).to have_content("Address Book")
  end
end
