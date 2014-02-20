shared_context 'ActiveRecord subclass' do
  before(:all) do
    @config = YAML::load_file(File.join(__dir__, 'config.yml'))
      .merge('adapter' => 'mysql2')
  end
  before(:each) { described_class.establish_connection(@config) }

  after(:each) { described_class.destroy_all }

  it "should wrap ActiveRecord" do
    described_class.ancestors.should include ActiveRecord::Base
  end
end