require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have the content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      page.should have_content 'Home'
    end
end
describe "Help page" do
    it "should have the content 'Help' in Help Page" do
    visit "/static_pages/help"
    page.should have_content "help"
end
end
describe "About Us page" do
    it "should have the content 'About Us' in About Us Page" do
    visit "/static_pages/about_us"
    page.should have_content "About Us"
end
it "should have the title  'About Us' in About Us Page" do
   visit "/static_pages/about_us"
page.should have_selector('title',
                    :text => "About Us")
end
  end

end
