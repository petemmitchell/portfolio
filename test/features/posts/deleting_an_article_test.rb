require "test_helper"

feature 'Deleting An Article Test' do
  scenario 'an existing blog to be deleted' do
    #Given that I have a blog post I want to delete
    Article.create(title: 'I hate errors', body: 'Means striving for excellence.')
    visit(articles_path)

    #When click on the delete post option
    page.find('tbody tr:last').click_on 'Destroy'

    #Then I should be shown a confirmation of the deletion
    page.text.must_include 'Article was successfully destroyed'
    page.text.wont_include 'I hate errors'
  end
end
