#myapp.rb

#use bundler
require 'rubygems'
require 'bundler/setup'
Bundler.require
require './models/TodoItem'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/development.db',
  :encoding => 'utf8'
)

#the fact that there's nothing after the '/' means that it's not going to a different webpage
get '/' do
  @tasks = TodoItem.all
  erb :list
end

post '/' do
  TodoItem.create(params)
  redirect '/'
end
