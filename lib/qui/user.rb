module Qui
  class User < ActiveRecord::Base
    attr_accessible :login, :real_name, :classe, :PASSWORD, :abilitato, :masterkey, :n_logon, :chiavi_utente, :ultimo_logon, :sys_dt_creazione, :sys_dt_modifica
    self.table_name = 'arch_users'
    
    def initialize(options={})
      if options then 
        super set_defaults(options) 
      else
        super
      end
    end

    def self.use_existing_connection connection
      establish_connection connection
    end

    private
      def set_defaults(options)
        options[:PASSWORD] ||= options.delete(:password)
        options[:abilitato] = "1"
        options[:masterkey] = "0"
        options[:n_logon]  = "0"
        options[:chiavi_utente] = " "
        options[:ultimo_logon] = Time.now
        options[:sys_dt_creazione] = Time.now
        options[:sys_dt_modifica] = Time.now
        return options
      end
  end
end
