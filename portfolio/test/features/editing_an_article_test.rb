require "test_helper"

feature 'Editing An Article' do
  scenario 'en existing post that needs to be edited' do
    #Given that I own a blog post I want to edit
    Article.create(title: articles(:cr).title, body: articles(:cr).body)
    visit article_path(articles(:cr))

    #When I choose the edit feature and commit changes
    click_link('Edit')
    fill_in 'Title', with: articles(:cr2).title
    click_on 'Update Article'

    #Then I should be shown my changes confirmed
    page.text.must_include 'Article was successfully updated'
    page.text.must_include articles(:cr2).title
  end
end
