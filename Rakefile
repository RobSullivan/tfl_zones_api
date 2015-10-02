require 'rake/testtask'
require_relative 'bin/app'
require 'sinatra/activerecord/rake'

Rake::TestTask.new do |t|
	t.libs << "tests"
	t.test_files = FileList['tests/test*.rb']
	t.verbose = true
end