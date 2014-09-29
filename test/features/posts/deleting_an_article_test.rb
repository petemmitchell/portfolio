require 'test_helper'

feature 'Deleting An Article' do
  # visitors
  scenario 'visitors should not be able to delete articles' do
    visit articles_path
    page.wont_have_link 'Destroy'
  end

  # authors
  scenario 'authors should not be able to delete articles' do
    visit articles_path
    page.wont_have_link 'Destroy'
  end

  # editors
  scenario 'editors should have the ability to delete articles' do
    # Given that I have a blog post I want to delete
    sign_in(:editor)
    visit articles_path

    # When click on the delete post option
    page.find('tbody tr:last').click_on 'Destroy'

    # Then I should be shown a confirmation of the deletion
    page.text.must_include 'Article was successfully destroyed'
  end
end
