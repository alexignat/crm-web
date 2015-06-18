require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

$rolodex = Rolodex.new # ??

$rolodex.add_contact(Contact.new("Alex", "Ignat", "alex@ignat.com", "is cool"))

get '/' do
  @crm_app_name = "your CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get '/contacts/1000' do
  @contact = $rolodex.find_contact(1000)
  erb :show_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end






