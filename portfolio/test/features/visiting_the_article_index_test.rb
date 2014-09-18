require "test_helper"

feature 'Visiting the Article Index' do
    scenario 'with existing posts' do
      # Given existing posts
      Article.create(title: 'Becoming a Code Fellow', body: 'Means striving for excellence.')

      # When I visit /posts
      visit(articles_path)

      # Then the existing posts should be loaded
      page.text.must_include 'Becoming a Code Fellow'
    end
  end
