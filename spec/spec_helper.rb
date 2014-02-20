#testing dependencies
require 'rubygems'
require 'bundler/setup'
require 'active_record_shared_context'

#gem
require 'qui'

RSpec.configure do |config|
  config.mock_with :rspec
  config.order = 'random'
end
