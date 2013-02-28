require 'spec_helper'

describe "StaticPages" do
  subject {page}
let(:base_title) {"Ruby on Rails Tutorial Sample App"}
  describe "Home Page" do
    before {visit root_path}
      it {should have_content 'Sample App'}
end
describe "Help page" do
    it "should have the content 'Help' in Help Page" do
    visit help_path
    page.should have_content "help"
end
end
describe "About Us page" do
it {should have_selector('h1',:text => (full_title"About Us"))}
end
describe "Contact page" do
it {should have_selector('title',
                    :text => full_title('Contact'))}
  end
end
