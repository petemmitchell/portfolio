require 'test_helper'

feature 'Adding comments with moderation to my articles' do
  scenario 'any site visitor wants to see comments' do
    visit article_path(articles(:cr))
    page.text.must_include 'Comments'
  end

  scenario 'a site visitor wants to add a comment to an article' do
    visit article_path(articles(:cr))
    fill_in 'Author', with: 'Your nemesis'
    fill_in 'Content', with: 'Your articles suck and you are a bad author'
    click_on 'Create Comment'
    page.text.must_include 'Your articles suck'
  end

  scenario 'an author or editor wants to approve comments to prevent spam' do
    visit article_path(articles(:cr))
    fill_in 'Author', with: 'Your nemesis'
    fill_in 'Content', with: 'Your articles suck and you are a bad author'
    click_on 'Create Comment'

    sign_in(:author)
    visit article_path(articles(:cr))
    check 'comment_approved'
  end
end
