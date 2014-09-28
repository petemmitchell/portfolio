require 'test_helper'

feature 'As a site owner I want to allow editors to publish, so that they may
 decide what is worthy of going live' do
  scenario 'editors can publish' do
    # Given an editor's account
    sign_in(:editor)

    # When I visit the new articles page
    visit new_article_path

    # There is a checkbox for publish
    page.must_have_field('Published')

    # When I submit the form
    fill_in 'Title', with: articles(:cr).title
    fill_in 'Body', with: articles(:cr).body
    check 'Published'
    click_on 'Update Article'

    # Then the publish article should be shown
    page.text.must_include 'Status: Published'
  end
end
