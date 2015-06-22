# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: rubyneat_rabbitmq 0.0.1.notreadyforuse.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubyneat_rabbitmq"
  s.version = "0.0.1.notreadyforuse.0"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Fred Mitchell"]
  s.date = "2015-06-21"
  s.description = "\n  To allow RubyNEAT to extend the phenotypes and evaluations in a distributed\n  and language-neutral manner, this plugin exists. Phenotype DSL is sent in\n  a JSON format through RabbitMQ and the evaluation results are returned via\n  the same. You may now set up worker queues on any number of servers to do \n  the evaluation and return the results.\n  "
  s.email = "fred.mitchell@gmx.de"
  s.executables = ["README.md"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".semver",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "bin/README.md",
    "lib/rubyneat_rabbitmq.rb",
    "rubyneat_rabbitmq.gemspec",
    "spec/lib/rubyneat_rabbitmq/rubyneat_rabbitmq_spec.rb",
    "spec/rubyneat_rabbitmq_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/flajann2/rubyneat_rabbitmq"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0")
  s.rubygems_version = "2.4.5"
  s.summary = "RabbitMQ Extension for RubyNEAT"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bunny>, ["~> 1.7"])
      s.add_runtime_dependency(%q<rubyneat>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2"])
      s.add_development_dependency(%q<yard>, ["~> 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<semver>, ["~> 1"])
      s.add_development_dependency(%q<guard>, ["~> 2"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 4"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<pry-doc>, [">= 0"])
      s.add_development_dependency(%q<pry-byebug>, [">= 0"])
      s.add_development_dependency(%q<pry-remote>, [">= 0"])
      s.add_development_dependency(%q<pry-rescue>, [">= 0"])
      s.add_development_dependency(%q<pry-stack_explorer>, [">= 0"])
    else
      s.add_dependency(%q<bunny>, ["~> 1.7"])
      s.add_dependency(%q<rubyneat>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2"])
      s.add_dependency(%q<yard>, ["~> 0"])
      s.add_dependency(%q<rdoc>, ["~> 3"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<semver>, ["~> 1"])
      s.add_dependency(%q<guard>, ["~> 2"])
      s.add_dependency(%q<guard-rspec>, ["~> 4"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<pry-doc>, [">= 0"])
      s.add_dependency(%q<pry-byebug>, [">= 0"])
      s.add_dependency(%q<pry-remote>, [">= 0"])
      s.add_dependency(%q<pry-rescue>, [">= 0"])
      s.add_dependency(%q<pry-stack_explorer>, [">= 0"])
    end
  else
    s.add_dependency(%q<bunny>, ["~> 1.7"])
    s.add_dependency(%q<rubyneat>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2"])
    s.add_dependency(%q<yard>, ["~> 0"])
    s.add_dependency(%q<rdoc>, ["~> 3"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<semver>, ["~> 1"])
    s.add_dependency(%q<guard>, ["~> 2"])
    s.add_dependency(%q<guard-rspec>, ["~> 4"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<pry-doc>, [">= 0"])
    s.add_dependency(%q<pry-byebug>, [">= 0"])
    s.add_dependency(%q<pry-remote>, [">= 0"])
    s.add_dependency(%q<pry-rescue>, [">= 0"])
    s.add_dependency(%q<pry-stack_explorer>, [">= 0"])
  end
end

