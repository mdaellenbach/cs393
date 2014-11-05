#myapp.rb

#use bundler
require 'rubygems'
require 'bundler/setup'
Bundler.require
require './models/TodoItem'
require './models/User'

if ENV['DATABASE_URL']
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
else
  ActiveRecord::Base.establish_connection(
    :adapter  => 'sqlite3',
    :database => 'db/development.db',
    :encoding => 'utf8'
  )
end



#the fact that there's nothing after the '/' means that it's not going to a different webpage
get '/' do
  @tasks = TodoItem.all.order(:date)
  erb :list
end

get '/:user_id' do
  #The example is:
  #@model = User.find(params[:user_id])
  #erb :model
  @users = User.find(todo_items).all.order(:date)
  erb :userlist
end

post '/:user_id' do
  TodoItem,create(params)
  redirect '/:user_id'
end

post '/' do
  User.create(params)
  redirect '/'
end

post '/delete' do
  TodoItem.find(params[:id]).destroy
  redirect '/'
end
