require File.expand_path('../config/application', __FILE__)

Portfolio::Application.load_tasks

require "rake/testtask"

task default: "test"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
end
