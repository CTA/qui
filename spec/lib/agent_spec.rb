require 'spec_helper'

describe Qui::Agent do
  include_context 'ActiveRecord subclass'

  it 'should set the table name' do
    Qui::Agent.table_name.should eq 'agenti_noti'
  end

  describe '.new' do
    let(:base_info) do
      { 'location' => 3,
        'aliases' => "",
        'group_by' => 1,
        'current_terminal' => " ",
        'xmpp_address' => " ",
        'payroll_code' => " ",
        'chiave_agente' => " "
      }
    end

    def info(options)
      base_info.merge(options)
    end

    it 'should forward to ActiveRecord::Base' do
      ActiveRecord::Base.should_receive :new
      Qui::Agent.new
    end

    it 'should accept "agent_name"' do
      subject = Qui::Agent.new agent_name: 'mark'
      subject.nome_agente.should eq 'mark'
    end

    it 'should accept "agent_description"' do
      subject = Qui::Agent.new agent_description: 'super cool'
      subject.descr_agente.should eq 'super cool'
    end

    it 'should set the default options' do
      subject = Qui::Agent.new
      base_info.each do |k, v|
        subject.send(k).to_s.should eq v.to_s
      end
    end

    it 'should allow overriding defaults' do
      Qui::Agent.new(location: 2).location.should eq 2
    end
  end
end