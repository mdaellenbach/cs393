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
  @users = User.all.order(:name)
  erb :userlist
end

get '/:user_id' do
  @tasks = TodoItem.find(params[:user_id])
  erb :list
end

post '/' do
  User.create(params)
  redirect '/'
end

post '/:user_id' do
  TodoItem.create(params)
  redirect "/#{params[:user_id]}"
end

post '/:user_id/delete' do
  TodoItem.find(params[:user_id]).destroy
  redirect "/#{params[:user_id]}"
end

post '/:user_id/create' do
  User.find(params[:user_id]).todo_items.create(params)
  redirect "/#{params[:user_id]}"
end
