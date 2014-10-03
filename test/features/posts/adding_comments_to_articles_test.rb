require 'test_helper'

feature 'Adding comments with moderation to my articles' do
  scenario 'any site visitor wants to see comments' do
    visit article_path(articles(:cr))
    click 'Show comments'
  end


  scenario 'a site visitor wants to add a comment to an article' do
    visit article_path(articles(:cr))
    fill_in 'Comment', with: 'Your articles sucks and you are a bad author'
    click 'Add Comment'
    page.text.must_include 'Comment added'
  end

  scenario 'an author or editor wants to approve comments to prevent spam' do
    visit article_path(articles(:cr))
    click 'Moderate comments'
  end
end
