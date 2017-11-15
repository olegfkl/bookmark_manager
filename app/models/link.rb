# require 'sinatra'
require 'dm-postgres-adapter'
require 'data_mapper'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

class Link
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :url, String
end


DataMapper.finalize
DataMapper.auto_upgrade!
