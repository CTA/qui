module Qui
  class Agent < ActiveRecord::Base
    attr_accessible :supervised_by, :nome_agente, :descr_agente, :location, :aliases, :group_by, :sys_dt_creazione, :current_terminal, :xmpp_address, :payroll_code, :chiave_agente, :sys_dt_modifica
    self.table_name = 'agenti_noti'

    def initialize(options={})
      ActiveRecord::Base.establish_connection 'queuemetrics'
      if options then 
        super set_defaults(options)
      else
        super
      end
    end
    
    def set_defaults(options)
      if options[:agent_name] then options[:nome_agente] = options.delete(:agent_name) end
      if options[:agent_description] then options[:descr_agente] = options.delete(:agent_description) end
      options[:location] = 3
      options[:aliases] = ""
      options[:group_by] = 1
      options[:sys_dt_creazione] = Time.now.to_s(:db)
      options[:current_terminal] = " "
      options[:xmpp_address] = " "
      options[:payroll_code] = " "
      options[:chiave_agente] = " "
      options[:sys_dt_modifica] = Time.now.to_s(:db)
      return options
    end

  end
end
