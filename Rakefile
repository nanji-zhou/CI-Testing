# You need Ruby (Rake, RWebSpec, ci_reporter gems installed)
#   Simplest way on Windows is to install RubyShell (http://testwisely.com/downloads)

require 'rubygems'
gem 'ci_reporter'
gem 'rspec'
require 'rspec/core/rake_task'
require 'ci/reporter/rake/rspec' # use this if you're using RSpec
require 'pry'

task :default => ["go"]

# List tests you want to exclude
#
def excluded_test_files
  ["ignore_spec.rb", "bad_test.rb"]
end

desc "run all tests in this folder"
RSpec::Core::RakeTask.new("go") do |t|
  test_files = Dir.glob("*_spec.rb") + Dir.glob("*_test.rb") - excluded_test_files
  t.pattern = FileList[test_files]
  t.rspec_opts = "" # to enable warning: "-w"
end
