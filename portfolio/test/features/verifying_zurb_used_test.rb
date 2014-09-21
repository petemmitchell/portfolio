require "test_helper"

feature "VerifyingZurbUsed" do
  scenario "to ensure Zurb Foundation is used for layout", js:true do
    # Given that Zurb's Foundation is installed

    # When I visit the root page
    visit root_path

    # Then the header stylesheet comes from the Foundation framework
    page.must_have_css 'meta[class="foundation-mq-topbar"]', :visible => false

  end
end
