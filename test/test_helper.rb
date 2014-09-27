ENV['RAILS_ENV'] = 'test'
# puts "Current environment: #{Rails.env}"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require 'minitest/rails/capybara'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :chrome

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in
  # alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in
  # integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in
    visit new_user_session_path
    fill_in 'Email', with: users(:dempsey).email
    fill_in 'Password', with: 'onlygodcanjudgeme'
    click_on 'Log in'
  end
end
