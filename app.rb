# app.rb
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'

enable :sessions

set :database, {adapter: 'sqlite3', database: 'topic.sqlite3'}



get '/' do
  erb :home
end

get '/login' do
  erb :login
end

# post '/login' do
#   user = User.where( username: params[:username] ).first
#   if user && user.password == params[:password] 
#     @user = user
#     session[:user_id] = user.id
#   else
#     redirect '/'
#   end
#   erb :home
# end

post '/login' do
  user = User.where( username: params[:username], password: params[:password] ).first
  if user
    session[:user_id] = user.id
  else
    redirect '/'
  end
  erb :home
end

get '/logout' do
  session.destroy
  redirect '/'
end

helpers do
  def current_user
    User.find(session[:user_id])
  end
end