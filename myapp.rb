#myapp.rb

#use bundler
require 'rubygems'
require 'bundler/setup'
Bundler.require
require './models/TodoItem'

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

post '/' do
  TodoItem.create(params)
  redirect '/'
end
