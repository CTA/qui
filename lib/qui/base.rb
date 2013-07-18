require 'active_record'

module Qui
  class Base

    def self.establish_connection(host, username, password)
      connection = {
        :adapter 	=> "mysql2",
        :host 		=> host,
        :database => "queuemetrics",
        :username => username,
        :password => password,
      }
      ActiveRecord::Base.establish_connection connection
    end

    def self.close_connection
      ActiveRecord::Base.connection.close
    end

  end
end
