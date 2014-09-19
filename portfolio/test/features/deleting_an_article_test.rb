require "test_helper"

feature 'Deleting An Article Test' do
  scenario 'an existing blog to be deleted' do
    #Given that I have a blog post I want to delete
    Article.create(title: articles(:cr).title, body: articles(:cr).body)
    visit(articles_path)

    #When click on the delete post option
    find_link('Destroy').click

    #Then I should be shown a confirmation of the deletion
    visit articles_path
    page.wont_have_content articles(:cr).title
  end
end
