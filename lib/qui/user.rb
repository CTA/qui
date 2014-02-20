module Qui
  class User < ActiveRecord::Base
    alias_attribute :password, :PASSWORD
    self.table_name = 'arch_users'

    def initialize(options={})
      super set_defaults(options) 
    end

    private
      def set_defaults(options)
        result = {}
        options.each do |key, value|
          result.merge! key.to_s => value
        end
        result['PASSWORD'] ||= result.delete('password')
        default_options.merge result
      end

      def default_options
        meow = Time.now
        {
          'abilitato' => "1",
          'masterkey' => "0",
          'n_logon'  => "0",
          'chiavi_utente' => " ",
          'ultimo_logon' => meow,
          'sys_dt_creazione' => meow,
          'sys_dt_modifica' => meow
        }
      end
  end
end
