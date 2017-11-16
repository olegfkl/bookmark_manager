require_relative 'link'
require_relative 'tag'
require_relative 'user'

require 'dm-postgres-adapter'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
