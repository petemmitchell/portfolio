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
    assert page.has_css?('#notice'), 'Expected a flash notice on this page, none
     found.'
    page.status_code.must_equal 200
  end
end
