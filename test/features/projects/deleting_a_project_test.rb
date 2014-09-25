require 'test_helper'

feature 'Deleting a Project' do
  scenario 'as a site owner I want to only keep my best work' do
    # Given a specific article needs to be deleted
    visit project_path(projects(:portfolio))
    # When I go to that article's page and click destroy
    click_on 'Delete'
    # I should see a confirmation of my action, then the projects page
    page.text.must_include 'success'
  end
end
