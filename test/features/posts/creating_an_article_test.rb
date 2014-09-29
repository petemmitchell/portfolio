require 'test_helper'

feature 'Creating An Article' do
  # visitors
  scenario "unauthenticated site visitors cannot visit new_article_path" do
  visit new_article_path
  page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site vistiors cannot see new article button" do
    visit articles_path
    page.wont_have_link "New Article"
  end

  # authors
  scenario 'authors are able to create a new article' do
    # Given an authorized user wants to create a new article
    sign_in(:author)
    visit new_article_path

    # When I fill in the attributes
    fill_in('Title', with: articles(:cr).title)
    fill_in('Body', with: articles(:cr).body)
    click_button('Update Article')

    # Then I am shown my new article to post
    page.text.must_include articles(:cr).title
    page.has_css? '#author'
    page.text.must_include users(:author).email
    page.text.must_include 'Status: Unpublished'
  end

  scenario 'authors are not able to publish articles' do
    sign_in(:author)
    visit new_article_path
    page.wont_have_field('Published')
  end

  # editors
  scenario 'editors are allowed to both create and publish articles' do
    sign_in(:editor)
    visit new_article_path
    page.must_have_field('Published')

    # When I fill in the attributes
    fill_in('Title', with: articles(:cr).title)
    fill_in('Body', with: articles(:cr).body)
    check 'Published'
    click_button('Update Article')

    # Then the publish article should be shown
    page.text.must_include 'Status: Published'
  end
end
