require 'test_helper'

feature 'Editing a project' do
  scenario 'as site owner I want to make changes to an existing project' do
    # Given a project exists
    visit edit_project_path(projects(:portfolio))

    # When I click edit I am given a form to update
    fill_in 'Technologies used', with: 'Ruby on Rails!'
    click_on 'Update Project'

    # Then submitting should save and show the changes to my project
    page.text.must_include 'success'
    page.text.must_include 'Ruby on Rails!'
    page.text.wont_include 'HTML5'
  end
end
