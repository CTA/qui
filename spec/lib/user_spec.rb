require 'active_record'
require 'qui/base'
require 'qui/user'

describe Qui::User do

  it "should wrap ActiveRecord" do
    Qui::User.ancestors.should include ActiveRecord::Base
  end

end
