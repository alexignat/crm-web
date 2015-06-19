require_relative 'rolodex'

require 'data_mapper'
require 'sinatra'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :note, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

$rolodex = Rolodex.new # ??

get '/' do
  @crm_app_name = "your CRM"
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get '/contacts/:id' do
  @contact = Contact.get(params[:id])
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

post '/contacts' do
  contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :note => params[:note]
    )
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
  if contact = Contact.put(params[:id].to_i)
    contact.first_name = params[:first_name]
    contact.last_name = params[:last_name]
    contact.email = params[:email]
    contact.note = params[:note]
    contact.save

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  contact = Contact.get(params[:id])
  contact.destroy

  redirect to('/contacts')
  # if @contact
  #   $rolodex.remove_contact(@contact)
  #   redirect to('/contacts')
  # else
  #   raise Sinatra::NotFound
  # end
end

















