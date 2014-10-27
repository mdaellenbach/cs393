require 'rubygems'
require 'bundler/setup'
Bundler.require

get '/' do
  erb :index
end

require 'json' #nice output formatting
post '/' do
  JSON.pretty_generate params
end

post '/' do
    File.open("todo.txt", "a") do |file|
    file.puts "#{params[:task]} - #{params[:date]}"
  end
end
