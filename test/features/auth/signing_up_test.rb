
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

  scenario 'sign in with twitter works' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:twitter, uid: '12345',
     info: { nickname: 'test_twitter_user' })
    visit root_path
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

    save_and_open_page
    click_on 'Sign in with Twitter'
    page.must_have_content 'Logged in as test_twitter_user'
  end
end
