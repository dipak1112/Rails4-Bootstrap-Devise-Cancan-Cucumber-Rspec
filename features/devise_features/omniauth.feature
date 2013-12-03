Feature: Hidden links
Scenario:Student is not signed up and tries to sign in with Twitter
      Given I do not exist as a student
      When I sign in as a student with twitter
      Then I should see a successful sign in message
      When I return to the site
  