# Qui

Qui, or Queuemetrics User Integration, is a gem that creates an ActiveRecord wrapper for manipulating users, agents, and queues within the Queuemetrics calling platform.

## Installation

Add this line to your application's Gemfile:

    gem 'qui'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qui

## Usage

First, connect to your Queuemetrics database:

    Queuemetrics.new("192.168.1.100","username","password")
    
Then simply create users, agents and queues using QueuemetricsAgent, QueuemetricsUser, and QueuemetricsQueue - all inhereit from ActiveRecord::Base.

User:

    u = QueuemetricsUser.new(login: "Agent/5555", password: "superSECRET", real_name: "Robert Weathers", classe: 4)
    u.save
    
Agent:

    a = QueuemetricsAgent.new(agent_name: "Agent/5555", agent_description: "rweathers", supervised_by: "Mr. Smith")
    a.save

You can add queues using ActiveRecord, but can also add or remove agents from queues like below:

    q = QueuemetricsQueue.first
    q.add_agent!("Agent/5555")
    q.remove_agent!("Agent/4445")

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
