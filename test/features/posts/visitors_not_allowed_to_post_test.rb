require "test_helper"

feature "As a site owner I want to keep visitors from posting articles" do
  scenario "unauthenticated site visitors cannot visit new_article_path" do
    # When I try to directly access the new article page
    visit new_article_path

    # Then I should be prompted to sign in or sign up
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site vistiors cannot see new article button" do
    # When I visit the blog index page
    visit articles_path

    # Then I should not see the "New Article" button
    page.wont_have_link "New Article"
  end
end
