require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

$rolodex = Rolodex.new # ??

$rolodex.add_contact(Contact.new("Alex", "Ignat", "alex@ignat.com", "is cool"))
$rolodex.add_contact(Contact.new("David", "Lang", "david@lang.com", "is not cool"))
$rolodex.add_contact(Contact.new("Ryan", "Petrillo", "ryan@petrillo.com", "is not cool"))
$rolodex.add_contact(Contact.new("Sacha", "Guberman", "sacha@guberman.com", "is not cool"))

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

get '/contacts/:id' do
  @contact = $rolodex.find_contact(params[:id])
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get 'contacts/:id/edit' do
  erb :edit_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end








