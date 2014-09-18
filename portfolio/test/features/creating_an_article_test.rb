require 'test_helper'

feature 'Creating An Article' do
  scenario 'form data to create a new article' do
    #Given I want to create a new article
    visit(new_article_path)

    #When I fill in the attributes
    fill_in('Title', :with => 'Becoming a Code Fellow')
    fill_in('Body', :with => 'Means striving for excellence.')
    click_button('Create Article')

    #Then I am shown my new article to post
    page.text.must_include 'Code Fellow'
  end
end
