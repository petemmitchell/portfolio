require 'test_helper'

feature 'Creating a project' do
  scenario 'as the site owner i want to create a portfolio' do
    # Given I visit the projects index
    visit projects_path
    click_on 'New project'

    # When I click on create new project and fill in the form
    fill_in 'Name', with: "Pete's Badass Portfolio"
    fill_in 'Technologies used', with: 'Rails, Ruby, Bootstrap, HTML5, CSS3'
    click_on 'Create Project'

    # Then a new project is created
    page.text.must_include 'Project has been created'
    assert page.has_css? '.success'
    page.status_code.must_equal 200
  end
end

feature 'Creating project' do
  scenario 'new project has invalid data' do
    # Given invalid project data in a form
    visit new_project_path


    # When the form is submitted with a short name and missing technologies_used
    # field
    fill_in 'Name', with: 'Q'
    click_on 'Create Project'

    # Then the form should be displayed again, with an error message.
    current_path.must_match /projects$/
    assert.has_css?('div#field_with_errors')
    page.text.must_include 'Name is too short'
    page.text.must_include "Technologies used can't be blank"
  end
end
