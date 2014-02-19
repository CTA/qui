module Qui
  class Queue < ActiveRecord::Base
    self.table_name = 'code_possibili'

    def add_agent!(userid)
      unless exists_in_queue?(userid)
        update_attributes agenti_membri: agenti_membri + "|#{userid}"
      end
    end

    def remove_agent!(userid)
      update_attributes agenti_membri: members.reject { |x| x == userid }
        .join(?|) if exists_in_queue?(userid)
    end

    def members
      agenti_membri.split ?|
    end

    def self.find_by_code(queue_code)
      where(composizione_coda: queue_code).first
    end

    private
      def exists_in_queue?(userid)
        self.agenti_membri.include?(userid)
      end
  end
end
