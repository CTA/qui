require 'spec_helper'
require 'yaml'
require 'qui/base'
require 'qui/agent'
require 'active_record'

describe Qui::Base do

  before do
    @q = YAML::load_file(File.join(__dir__, 'config.yml'))
  end

  #connected? returns opposite bool
  describe ".establish_connection" do
    it "establishes a connection to a Queuemetrics database." do
      Qui::Base.establish_connection(@q["host"], @q["username"], @q["password"])
      ActiveRecord::Base.connected?.should be_false
      ActiveRecord::Base.connection.current_database.should eq("queuemetrics")
    end
  end

  describe ".close_connection" do
    it "closes a connection to the Queuemetrics database." do
      Qui::Base.close_connection
      ActiveRecord::Base.connected?.should be_true
    end
  end

end
