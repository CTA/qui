module Qui
  class Agent < ActiveRecord::Base
    attr_accessible :supervised_by, :nome_agente, :descr_agente, :location,
                    :aliases, :group_by, :sys_dt_creazione, :current_terminal,
                    :xmpp_address, :payroll_code, :chiave_agente, :sys_dt_modifica
    self.table_name = 'agenti_noti'

    def initialize(options={})
      super set_defaults(options)
    end
    
    private
      def set_defaults(options)
        result = {}
        options.each do |key, value|
          result.merge! key.to_s => value
        end
        result['nome_agente'] ||= result.delete('agent_name')
        result['descr_agente'] ||= result.delete('agent_description')
        default_options.merge result
      end

      def default_options
        meow = Time.now.to_s(:db)
        {
          'location' => 3,
          'aliases' => "",
          'group_by' => 1,
          'current_terminal' => " ",
          'xmpp_address' => " ",
          'payroll_code' => " ",
          'chiave_agente' => " ",
          'sys_dt_creazione' => meow,
          'sys_dt_modifica' => meow
        }
      end
  end
end