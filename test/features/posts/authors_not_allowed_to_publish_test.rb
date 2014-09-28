require 'test_helper'

feature 'As a site owner I want to prevent authors from publishing, so that the
  editor may decide what is worthy of going live' do
  scenario "authors can't publish" do
   # Given author's account
   sign_in(:oba)

   # When I visit the new articles page
   visit new_article_path
   save_and_open_page

   # There is no check box for published
   page.wont_have_field('Published')
  end
end
