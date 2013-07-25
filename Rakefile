# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "subdivision_responder"
  gem.homepage = "https://github.com/chargify/subdivision_responder"
  gem.license = "MIT"
  gem.summary = %Q{A Rack app that responds to queries containing a country code with appropriate subdivision data as JSON.}
  gem.description = %Q{A Rack app that responds to queries containing a country code with appropriate subdivision data as JSON.}
  gem.email = "moklett@gmail.com"
  gem.authors = ["Michael Klett"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
    spec.pattern = 'spec/**/*_spec.rb'
      spec.rcov = true
end

task :default => :spec
