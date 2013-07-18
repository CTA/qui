require 'active_record'
require 'qui/base'
require 'qui/agent'

describe Qui::Agent do

  it "should wrap ActiveRecord" do
    #@q = YAML::load_file(File.join(__dir__, 'config.yml'))
    #Qui::Base.establish_connection(@q["host"], @q["username"], @q["password"])
    Qui::Agent.superclass.should == ActiveRecord::Base
  end

end
