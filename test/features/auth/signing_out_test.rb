require 'test_helper'

feature "As a site owner, I want to be able to sign people out because I
like being a dictator" do
  scenario 'sign out' do
    # Given a user is signed in
    visit '/'
    click_on 'Log In'
    fill_in 'Email', with: users(:oba).email
    fill_in 'Password', with: 'backflips'
    click_on 'Log in'

    # When they click on "Sign Out"
    click_on('Sign Out')
    # Then they are signed out with a confirmation message
    page.text.must_include('success')
  end
end
