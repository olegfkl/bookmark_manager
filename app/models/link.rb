require 'sinatra'
require 'dm-postgres-adapter'
require 'data_mapper'

DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')

class Link
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :url, Text
end


DataMapper.finalize
DataMapper.auto_upgrade!
