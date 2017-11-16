ENV['RACK_ENV'] ||= 'development'

require './app/models/database_config'
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

get '/tags/:tag' do |name|
  tag = Tag.first(name: name)
  @links = tag ? tag.links : []
  erb(:links)
end

post '/links/save' do
  link = Link.create(title: params[:title], url: params[:url])
  link.tags << Tag.first_or_create(name: params[:tag])
  link.save
  redirect '/links'
end

run! if app_file == $0
end
