require "test_helper"

class CanAccessHomeTest < Capybara::Rails::TestCase
  def test_homepage_has_content
    visit "http://localhost:3000"
    assert page.has_content?("Welcome#index")
  end
end
