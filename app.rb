require 'sinatra/base'

class BookmarkManager < Sinatra::Base

get '/' do
  @link1 = BookmarkManager.get(1)
  erb(:index)
end

run! if app_file == $0
end
