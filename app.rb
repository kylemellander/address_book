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
  Phone.new({:phone_type => @phone_type, :phone_number => @phone_number, :contact_id => @contact_id}).save()
  @contact = Contact.find(@contact_id)
  erb(:contact)
end

post ('/contact/:contact_id/address/new') do
  @contact_id = params.fetch("contact_id").to_i
  @address_type = params.fetch("address_type")
  @street = params.fetch("street")
  @city = params.fetch("city")
  @state = params.fetch("state")
  @zipcode = params.fetch("zipcode")
  Address.new({:address_type => @address_type, :street => @street, :city => @city, :state => @state, :zipcode => @zipcode, :contact_id => @contact_id}).save()
  @contact = Contact.find(@contact_id)
  erb(:contact)
end

post ('/contact/:contact_id/email/new') do
  @contact_id = params.fetch("contact_id").to_i
  @email_type = params.fetch("email_type")
  @email_address = params.fetch("email_address")
  Email.new({:email_type => @email_type, :email_address => @email_address, :contact_id => @contact_id}).save()
  @contact = Contact.find(@contact_id)
  erb(:contact)
end

get ('/address/:contact_id/:id/delete') do
  @contact_id = params.fetch('contact_id').to_i
  @id = params.fetch('id').to_i
  Address.delete(@id)
  @contact = Contact.find(@contact_id)
  erb(:contact)
end

get ('/email/:contact_id/:id/delete') do
  @contact_id = params.fetch('contact_id').to_i
  @id = params.fetch('id').to_i
  Email.delete(@id)
  @contact = Contact.find(@contact_id)
  erb(:contact)
end

get ('/phone/:contact_id/:id/delete') do
  @contact_id = params.fetch('contact_id').to_i
  @id = params.fetch('id').to_i
  Phone.delete(@id)
  @contact = Contact.find(@contact_id)
  erb(:contact)
end

get ('/contact/:contact_id') do
  @contact_id = params.fetch("contact_id").to_i
  @contact = Contact.find(@contact_id)
  erb(:contact)
end

get ('/contact/:contact_id/delete') do
  @contact_id = params.fetch("contact_id").to_i
  Contact.delete(@contact_id)
  erb(:index)
end
