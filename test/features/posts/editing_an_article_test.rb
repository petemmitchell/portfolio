require 'test_helper'

feature 'Editing An Article' do
  # visitors
  scenario 'unauthenticated site visitors cannot visit edit_article_path' do
    visit edit_article_path(:cr)
    page.must_have_content 'You need to sign in or sign up before continuing'
  end

  scenario 'unauthenticated site vistiors cannot see edit article button' do
    visit articles_path
    page.wont_have_link 'Edit'
  end

  # authors
  scenario 'authors should only be able to edit their own articles' do
    sign_in(:author)
    visit edit_article_path(articles(:cr))

    visit edit_article_path(articles(:cr2))
    page.must_have_content 'You are not authorized to perform this action.'
  end

  scenario 'en existing post that needs to be edited' do
    # Given that I own a blog post I want to edit
    sign_in
    Article.create(title: articles(:cr).title, body: articles(:cr).body)
    visit article_path(articles(:cr))

    # When I choose the edit feature and commit changes
    click_link('Edit')
    fill_in 'Title', with: articles(:cr2).title
    click_on 'Update Article'

    # Then I should be shown my changes confirmed
    page.text.must_include 'Article was successfully updated'
    page.text.must_include articles(:cr2).title
  end
end
