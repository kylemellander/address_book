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
