require 'active_record'

module Qui
  class Base
    def self.establish_connection(host, username, password)
      ActiveRecord::Base.configurations['queuemetrics'] = {
        :adapter 	=> "mysql2",
        :host 		=> host,
        :database => "queuemetrics",
        :username => username,
        :password => password,
      }
      ActiveRecord::Base.establish_connection
    end

    def self.close_connection
      ActiveRecord::Base.connection.close
    end
  end
end
