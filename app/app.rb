ENV['RACK_ENV'] ||= 'development'

require './app/models/database_config'
require 'sinatra/base'
require './app/models/link.rb'
require './app/models/user.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    # @link1 = BookmarkManager.get(1)
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/new-user' do
    User.create(
      username: params[:username], password: params[:password])
    session[:username] = params[:username]
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:links, locals: { username: session[:username] })
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
    params[:tag].split(',').map(&:strip).each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  run! if app_file == $0
end
