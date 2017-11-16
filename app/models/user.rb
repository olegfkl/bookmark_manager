require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, Text
  property :password, Text
end
