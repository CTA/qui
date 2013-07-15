class QueuemetricsAgent < ActiveRecord::Base
	self.table_name = 'agenti_noti'

  def initialize(options={})
    if options then 
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
      super(options)
    else
      super
    end
  end
  
end
