require 'spec_helper'

describe Qui::Location do
  it "should wrap ActiveRecord" do
    Qui::Location.ancestors.should include ActiveRecord::Base
  end

  it 'should set the table name' do
    Qui::Location.table_name.should eq 'locations'
  end
end