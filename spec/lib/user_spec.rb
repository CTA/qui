require 'active_record'
require 'qui/base'
require 'qui/user'

describe Qui::User do

  it "should wrap ActiveRecord" do
    # @q = YAML::load_file(File.join(__dir__, 'config.yml'))
    # Queuemetrics.establish_connection(@q["host"], @q["username"], @q["password"])
    Qui::User.superclass.should == ActiveRecord::Base
  end

end
