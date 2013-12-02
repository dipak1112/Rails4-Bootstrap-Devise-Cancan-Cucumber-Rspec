##-------------------------USER EDIT FEATURES--------------------------------##
Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change my username

    Scenario: I sign in and edit my account
      Given I am logged in
      When I edit my account details
      Then I should see an account edited message

    Scenario Outline: static label and hint on edit page
    	Given I am logged in
    	When I follow "Edit account"
    	Then I should see "<fieldset>"

    	Examples:
    		| fieldset 	|
    		| Edit User |
    		| Email 		|
    		| Password 	|
    		| Name			|
    		|	Password confirmation |
    		| Current password |
    		| leave it blank if you don't want to change it |
    		| we need your current password to confirm your changes |

    Scenario: display link about cancel my account in edit page
    	Given I am logged in
    	When I follow "Edit account"
    	Then I should see "Cancel my account"
    	And I should see "Unhappy?"

    Scenario: cancel my account
    	Given I am logged in
    	When I follow "Edit account"
    	And I should see "Cancel my account"
    	And I follow "Cancel my account"
    	Then I should see "Bye! Your account was successfully cancelled. We hope to see you again soon."