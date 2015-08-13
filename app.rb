require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/address')
require('./lib/phone')
require('./lib/email')
also_reload('lib/**/*.rb')

get ('/') do
  erb(:index)
end

post ('/contact/new') do
  @first_name = params.fetch("first_name")
  @last_name = params.fetch("last_name")
  @title = params.fetch("title")
  @job_title = params.fetch("job_title")
  @contact = Contact.new({:first_name => @first_name, :last_name => @last_name, :title => @title, :job_title => @job_title })
  @contact.save()
  erb(:contact)
end
