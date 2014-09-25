require 'test_helper'

feature 'Visiting the Article Index' do
  scenario 'with existing posts' do
    # Given existing posts
    Article.create(title: articles(:cr).title, body: articles(:cr).body)

    # When I visit /posts
    visit(articles_path)

    # Then the existing posts should be loaded
    page.text.must_include articles(:cr).title
  end
end
