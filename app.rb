# app.rb
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'

enable :sessions

set :database, {adapter: 'sqlite3', database: 'topic.sqlite3'}



get '/' do
  @body_class = " class=\"background\""
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

get '/tree' do 
  # to do: define our image @img
  # 1) hard code image names into array and select one
  # @img = "/img/slideshow/" + ['tree1.jpg','goat_tree.jpeg','another_tree.jpeg'].sample
  # 2) look-up files & select one
  @img = Dir.new('./public/img/slideshow').select{|a| a[0] != '.'}.sample
  erb :gallery
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