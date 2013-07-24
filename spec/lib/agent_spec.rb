require 'active_record'
require 'qui/base'
require 'qui/agent'

describe Qui::Agent do

  it "should wrap ActiveRecord" do
    Qui::Agent.ancestors.should include ActiveRecord::Base
  end

end
