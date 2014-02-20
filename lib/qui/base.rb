module Qui
  class Base
    DEFAULT_OPTIONS = { 'adapter' => "mysql2", 'database' => "queuemetrics" }

    def self.establish_connection(options)
      ActiveRecord::Base.configurations['queuemetrics'] ||= configure_options(options)
      ActiveRecord::Base.establish_connection 'queuemetrics'
    end

    def self.close_connection
      ActiveRecord::Base.connection.close
    end

    private
      def self.configure_options(options)
        result = {}
        options.each do |key, value|
          result.merge! key.to_s => value
        end
        DEFAULT_OPTIONS.merge result
      end
  end
end