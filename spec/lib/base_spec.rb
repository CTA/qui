require 'spec_helper'

describe Qui::Base do
  subject { Qui::Base }

  before(:all) { @config = YAML::load_file(File.join(__dir__, 'config.yml')) }
  before(:all) { Qui::Base.establish_connection(@config) }
  let(:expected_config) { { 'adapter' => 'mysql2' }.merge(@config) }

  describe '.establish_connection' do
    it 'sets up the "queuemetrics" configuration' do
      ActiveRecord::Base.configurations['queuemetrics'].should eq expected_config
    end

    it 'establishes a connection to a Queuemetrics database.' do
      subject.establish_connection(@config)
      ActiveRecord::Base.connection.current_database
        .should eq @config['database']
    end
  end

  describe '.close_connection' do
    it 'closes a connection to the Queuemetrics database.' do
      ActiveRecord::Base.connection.should_receive(:close)
      subject.close_connection
    end
  end
end
