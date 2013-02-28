require 'spec_helper'

describe "StaticPages" do
let(:base_title) {"Ruby on Rails Tutorial Sample App"}
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
page.should have_selector('h1',
                    :text => "About Us")
end
end
describe "Contact page" do
    it "should have the content 'Contact' in this Page" do
    visit "/static_pages/contact"
    page.should have_content "Contact"
end
it "should have the title  'Contact' Page" do
   visit "/static_pages/contact"
page.should have_selector('title',
                    :text => "#{base_title} | Contact")
end
  end
end
