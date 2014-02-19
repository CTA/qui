require 'spec_helper'

describe Qui::User do
  include_context 'ActiveRecord subclass'

  it 'should set the table name' do
    Qui::User.table_name.should eq 'arch_users'
  end

  describe '.new' do
    let(:base_info) do
      { 'abilitato' => "1", 'masterkey' => "0", 
        'n_logon'  => "0", 'chiavi_utente' => " " }
    end

    def info(options)
      base_info.merge(options)
    end

    it 'should forward to ActiveRecord::Base' do
      ActiveRecord::Base.should_receive :new
      Qui::User.new
    end

    it 'should accept "password"' do
      subject = Qui::User.new password: 'le_secret'
      subject.PASSWORD.should eq 'le_secret'
    end

    it 'should alias password to PASSWORD' do
      subject = Qui::User.new password: 'le_secret'
      subject.should respond_to :password
      subject.password.should eq subject.PASSWORD
    end

    it 'should set the default options' do
      subject = Qui::User.new
      base_info.each do |k, v|
        subject.send(k).to_s.should eq v.to_s
      end
    end

    it 'should allow overriding defaults' do
      Qui::User.new(masterkey: 5).masterkey.should eq 5
    end
  end
end
