require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

$rolodex = Rolodex.new # ??


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

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

get '/contacts/:id/edit' do
  @contact = $rolodex.find_contact(params[:id])
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = $rolodex.find_contact(params[:id])
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = $rolodex.find_contact(params[:id])
  if @contact
    $rolodex.remove_contact(@contact)
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

















