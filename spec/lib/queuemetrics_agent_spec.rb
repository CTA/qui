require 'active_record'
require 'qui/queuemetrics'
require 'qui/queuemetrics_agent'

describe QueuemetricsAgent do

  it "should wrap ActiveRecord" do
    @q = YAML::load_file(File.join(__dir__, 'config.yml'))
    Queuemetrics.establish_connection(@q["host"], @q["username"], @q["password"])
    QueuemetricsAgent.superclass.should == ActiveRecord::Base
  end

end
