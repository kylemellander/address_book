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

post ('/contact/:contact_id/phone/new') do
  @contact_id = params.fetch("contact_id").to_i
  @phone_type = params.fetch("phone_type")
  @phone_number = params.fetch("phone_number")
  (Phone.new({:phone_type => @phone_type, :phone_number => @phone_number, :contact_id => @contact_id})).save()
  @contact = Contact.find(@contact_id)
  erb(:contact)
end
