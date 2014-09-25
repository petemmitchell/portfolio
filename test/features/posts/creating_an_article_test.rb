require 'test_helper'

feature 'Creating An Article' do
  scenario 'form data to create a new article' do
    # Given I want to create a new article
    visit(new_article_path)

    # When I fill in the attributes
    fill_in('Title', with: articles(:cr).title)
    fill_in('Body', with: articles(:cr).body)
    click_button('Create Article')

    # Then I am shown my new article to post
    page.text.must_include articles(:cr).title
  end
end
