ENV['RACK_ENV'] ||= 'development'



require 'sinatra/base'
require './app/models/link.rb'

class BookmarkManager < Sinatra::Base

get '/' do
  # @link1 = BookmarkManager.get(1)
  erb(:index)
end

get '/links' do
  @links = Link.all
  erb(:links)
end

get '/links/new' do
  erb(:new)
end

post '/links/save' do
  Link.create(title: params[:title], url: params[:url])
  redirect '/links'
end

run! if app_file == $0
end
