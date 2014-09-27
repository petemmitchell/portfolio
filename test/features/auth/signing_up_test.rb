
require 'test_helper'

feature 'As site owner, I want to authenticate visitors to prevent unauthorized
posts or access to my site' do
  scenario 'sign up' do
    # Given a registration form
    visit '/'
    click_on 'Sign Up'

    # When the user registers with valid info
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    # Then the should be signed up with confirmation
    page.must_have_content 'Welcome! You have signed up successfully'
    page.wont_have_content 'There was a problem with your sign up'
  end
end
