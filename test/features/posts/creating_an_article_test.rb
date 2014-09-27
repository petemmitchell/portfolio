require 'test_helper'

feature 'Creating An Article' do
  scenario 'form data to create a new article' do
    # Given an authorized user wants to create a new article
    sign_in
    visit new_article_path

    # When I fill in the attributes
    fill_in('Title', with: articles(:cr).title)
    fill_in('Body', with: articles(:cr).body)
    click_button('Update Article')

    # Then I am shown my new article to post
    page.text.must_include articles(:cr).title
    page.has_css? '#author'
    page.text.must_include users(:dempsey).email
  end
end
