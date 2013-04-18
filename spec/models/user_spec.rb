# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before {@user = FactoryGirl.create(:user)}
  subject {@user}
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it {should respond_to(:authenticate)}


describe "should check name validity" do
before {@user.name = ""}
it {should_not be_valid}
end
describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
describe "when name is too long" do
before {@user.name = 'a' * 51}
it {should_not be_valid}
end

describe "email invalid checks" do
 it "should NOT be valid" do
 addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
 addresses.each do |address|
@user.email = address
@user.should_not be_valid
end
end
end


describe "email validation checks" do
it "should be valid" do
email_adds = %w[hi@bye.com user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
email_adds.each do |address|
@user.email = address
@user.should be_valid
end
end
end

describe "password validations" do
it "should check password mismatch" do
@user.password_confirmation = 'mismatch'
@user.should_not be_valid
end

it "should not allow blank password" do
@user.password = @user.password_confirmation = ""
@user.should_not be_valid
end

it "should not allow, nil password as password_confirmation" do
@user.password_confirmation = nil
@user.should_not be_valid
end
end

describe "password length check" do
before {@user.password = @user.password_confirmation = "d"*5}
it {should be_invalid}
end

describe "authentication checks" do
before {@user.save}
let(:found_user) {User.find_by_email(@user.email)}

describe "with valid pwd" do
it {should == found_user.authenticate(@user.password)}
end

describe "with invalid pwd" do
it {should_not == found_user.authenticate('inavlid')}
specify {found_user.authenticate('inavlid').should be_false}
end
end

end


