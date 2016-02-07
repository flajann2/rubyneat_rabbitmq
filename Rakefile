# encoding: utf-8

require 'rubygems'
require 'bundler'
require 'semver'

def s_version
  SemVer.find.format "%M.%m.%p%s"
end

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'juwelier'
Juwelier::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "rubyneat_rabbitmq"
  gem.homepage = "http://github.com/flajann2/rubyneat_rabbitmq"
  gem.license = "MIT"
  gem.summary = %Q{RabbitMQ Extension for RubyNEAT}
  gem.version = s_version
  gem.required_ruby_version = '>= 2.0'

  gem.description = %Q{
  To allow RubyNEAT to extend the phenotypes and evaluations in a distributed
  and language-neutral manner, this plugin exists. Phenotype DSL is sent in
  a JSON format through RabbitMQ and the evaluation results are returned via
  the same. You may now set up worker queues on any number of servers to do 
  the evaluation and return the results.
  }
  gem.email = "fred.mitchell@gmx.de"
  gem.authors = ["Fred Mitchell"]

  gem.files.exclude 'foo/**/*', 'rdoc/*',
                    '.idea/**/*', '.idea/**/.*', '.yardoc/**/*',
                    'doc/**/*',
                    'Guardfile'
end

Juwelier::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
