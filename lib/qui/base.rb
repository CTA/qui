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
      ActiveRecord::Base.establish_connection 'queuemetrics'
    end

    def self.close_connection
      ActiveRecord::Base.connection('queuemetrics').close
    end

  end
end
