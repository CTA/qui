class QueuemetricsQueue < ActiveRecord::Base
  self.table_name = 'code_possibili'

  def initialize(options={}) super(options) end

  def add_agent!(userid)
    if exists_in_queue?(userid) then
      false
    else
      self.agenti_membri += "|#{userid}"
      self.save
    end
  end

  def remove_agent!(userid)
    if exists_in_queue?(userid) then 
      members = self.agenti_membri.split("|")
      members.delete userid
      self.agenti_membri = members.join("|")
      self.save
    else
      false
    end
  end

  private

  def exists_in_queue?(userid)
    if self.agenti_membri.include?(userid) then true else false end
  end

end
