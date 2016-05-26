# rubyneat_rabbitmq -- RabbitMQ plugin for RubyNEAT

[![Join the chat at https://gitter.im/flajann2/rubyneat_rabbitmq](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/flajann2/rubyneat_rabbitmq?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

To allow RubyNEAT to extend the phenotypes and evaluations in a
distributed and language-neutral manner, this plugin exists.
Phenotype DSL is sent in a JSON format through RabbitMQ and the
evaluation results are returned via the same. You may now set up
worker queues on any number of servers to do the evaluation
and return the results.

## Gem Version
[![Gem Version](https://badge.fury.io/rb/rubyneat_rabbitmq.png)](http://badge.fury.io/rb/rubyneat_rabbitmq)
[![Travis CI](https://travis-ci.org/flajann2/rubyneat_rabbitmq.svg?branch=master)](https://travis-ci.org/flajann2/rubyneat_rabbitmq)

## Overview
Comming soon.

## Contributing to rubyneat_rabbitmq
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2015-2016 Fred Mitchell. See LICENSE.txt for
further details.
