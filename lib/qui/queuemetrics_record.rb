module QueuemetricsRecord
  include ActiveRecord::Base

  def save
    if self.exists? then 
      message = false
    else
      message = true
      begin
				self.class.create(self.db_attributes)
      rescue Exception => e
        message = false
      end
    end
    return message
  end

  def delete
    if self.exists? then 
      u = self.class.where(:nome_agente => "Agent/#{@userid}", :descr_agente => @username).first
      u.destroy
    else
      false
    end
  end

end
