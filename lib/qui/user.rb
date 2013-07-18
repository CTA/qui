module Qui
  class User < ActiveRecord::Base
    self.table_name = 'arch_users'
    
    def initialize(options={})
      if options then 
        super set_defaults(options) 
      else
        super
      end
    end

    private

      def set_defaults(options)
        options[:abilitato] = "1"
        options[:masterkey] = "0"
        options[:n_logon]  = "0"
        options[:chiavi_utente] = " "
        options[:ultimo_logon] = Time.now.to_s(:db)
        options[:sys_dt_creazione] = Time.now.to_s(:db)
        options[:sys_dt_modifica] = Time.now.to_s(:db)
      end

  end
end
