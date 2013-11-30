# Methods #
#******************************************************#
def create_visitor
  @visitor ||= { :name => "Dipak", :email => "dipak@yopmail.com",
    :password => "password", :password_confirmation => "password" }
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email], password: @visitor[:password])
end

def delete_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
  @user.destroy unless @user.nil?
end

def sign_in
  visit '/users/sign_in'
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  click_button "Sign in"
end

# Steps  #
#******************************************************#

## GIVEN ##

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I am not logged in$/ do
  visit '/users/sign_out'
end


## Then ## 

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end


Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end


## WHEN ## 

When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I return to the site$/ do
  visit '/'
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end


