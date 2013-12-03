def set_omniauth(opts = {})
  default = {:provider => :facebook,
             :uuid     => "1234",
             :facebook => {
                            :email => "foobar@example.com",
                          }
            }

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

   OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    :provider => 'twitter',
    :uid => '123545'
    # etc.
  })
end
Given /^I do not exist as a student$/ do
  visit root_path  
end
When /^I sign in as a student with twitter$/ do
  set_omniauth
  visit "/users/auth/twitter"
end
Then /^I should see a successful sign in message$/ do
  page.should have_content "Logout"
end
