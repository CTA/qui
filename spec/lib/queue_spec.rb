require 'spec_helper'
require 'qui/base'
require 'qui/queue'

describe Qui::Queue do

  before do
    @queue = Qui::Queue.first
    @userid = 'agent/128461849'
  end

  it "should wrap ActiveRecord" do
    # @q = YAML::load_file(File.join(__dir__, 'config.yml'))
    # Qui::Base.establish_connection(@q["host"], @q["username"], @q["password"])
    Qui::Queue.superclass.should == ActiveRecord::Base
  end

  describe ".add_agent!" do
    before do
      @members = @queue.agenti_membri
    end
    
    it "should add an agent to a queue object." do
      @members.should_not include(@userid)
      @queue.add_agent!(@userid)
      @queue.agenti_membri.should include(@userid)
    end

    after do #return queue to prior state
      @queue.agenti_membri = @members
      @queue.save
    end
  end

  describe ".remove_agent!" do
    before do
      @members = @queue.agenti_membri
      @queue.agenti_membri = @members += "|#{@userid}"
    end
    
    it "should remove an agent from a queue object." do
      @queue.agenti_membri.should include(@userid)
      @queue.remove_agent!(@userid)
      @queue.agenti_membri.should_not include(@userid)
    end

    after do
      if @queue.agenti_membri.include?(@userid)
        members = @queue.agenti_membri.split("|")
        members.delete @userid
        @queue.agenti_membri = members.join("|")
        @queue.save
      end
    end
  end

end
