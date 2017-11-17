ENV['RACK_ENV'] ||= 'development'

require './app/models/database_config'
require 'sinatra/base'
require './app/models/link.rb'
require './app/models/user.rb'
require 'bcrypt'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb(:index)
  end

  get '/users/new' do
    erb(:signup)
  end

  post '/users' do
    user = User.create(
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                  )
    session[:user_id] = user.id
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new)
  end

  get '/tags/:tag' do
    tag = Tag.first(name: params[:tag])
    @links = tag.links
    erb(:links)
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tag].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  run! if app_file == $0
end
