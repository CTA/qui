require 'spec_helper'

describe Qui::Queue do
  include_context 'ActiveRecord subclass'

  subject { Qui::Queue.new(info) }
  let(:userid) { 'agent/128461849' }
  let(:info) { {
    composizione_coda: 'hello',
    agenti_membri: 'agent/001|agent/002',
    agenti_spilloff_1: 'hello',
    agenti_spilloff_2: 'hello',
    report_to: 'hello',
    chat_group: 'hello',
    agaw_lookback_min: 19,
    agaw_enabled: 4,
    queue_url: 'hello',
    sys_dt_creazione: Time.now,
    sys_dt_modifica: Time.now
  } }

  it 'should set the table name' do
    Qui::Queue.table_name.should eq 'code_possibili'
  end

  describe '.add_agent!' do
    context 'agent exists in queue' do
      before { subject.agenti_membri += "|#{userid}" }

      it { subject.add_agent!(userid).should be_nil }
    end

    context 'agent not in queue' do
      it 'should add an agent to a queue object' do
        subject.agenti_membri.should_not include(userid)
        subject.add_agent!(userid)
        subject.agenti_membri.should include(userid)
      end
    end
  end

  describe '.remove_agent!' do
    context 'agent exists in queue' do
      before { subject.agenti_membri += "|#{userid}" }

      it 'should remove an agent from a queue object.' do
        subject.agenti_membri.should include(userid)
        subject.remove_agent!(userid)
        subject.agenti_membri.should_not include(userid)
      end
    end

    context 'agent not in queue' do
      it { subject.remove_agent!(userid).should be_nil }
    end
  end

  describe '.members' do
    it { subject.members.should be_an(Array) }

    it 'should return all members' do
      subject.members.should eq %w[agent/001 agent/002]
    end

    context 'no members in queue' do
      before(:each) { subject.update_attributes agenti_membri: '' }

      it 'should return an empty array' do
        subject.members.should eq []
      end
    end
  end

  describe '#find_by_code' do
    context 'given an existing queue_code' do
      before(:each) { subject.save }

      it 'should return the corresponding Queue' do
        Qui::Queue.find_by_code(subject.composizione_coda)
          .should eq subject
      end
    end

    context 'given a queue_code that does not exist' do
      it { Qui::Queue.find_by_code('foo').should be_nil }
    end
  end
end
