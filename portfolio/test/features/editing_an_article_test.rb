require "test_helper"

feature 'Editing An Article' do
  scenario 'en existing post that needs to be edited' do
    #Given that I own a blog post I want to edit
    @article = Article.create(title: 'Becoming a Code Fellow', body: 'Means striving for excellence.')
    visit article_path(@article)

    #When I choose the edit feature and commit changes
    click_link('Edit')
    fill_in 'Title', with: 'Becoming a Web Developer'
    click_on 'Update Article'

    #Then I should be shown my changes confirmed
    page.text.must_include 'Article was successfully updated'
    page.text.must_include 'Web Developer'
  end
end
