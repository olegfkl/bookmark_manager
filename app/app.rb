require 'sinatra/base'
require './app/models/link.rb'

class BookmarkManager < Sinatra::Base

get '/' do
  # @link1 = BookmarkManager.get(1)
  erb(:index)
end

get '/links' do
  @link1 = Link.get(1)
  erb(:links)
end

get '/links/new' do
  erb(:new)
end

run! if app_file == $0
end
