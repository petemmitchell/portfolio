require "test_helper"

feature "As the site visitor, I want to see a specific project" do
  scenario "viewing a project" do
   # Given a project
   # When I visit /projects
   visit project_path(projects(:freelance))
   # Then I should see the details of that project
   page.text.must_include "Barnyard Cereal"
   page.text.must_include "Ruby, Rails"
  end
end
