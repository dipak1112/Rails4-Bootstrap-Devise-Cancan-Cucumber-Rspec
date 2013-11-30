Feature: Sign in User
	In order to get access to protected sections of the site
	A User
	Should be able to sign in

		Scenario Outline: Display labels and sign in page
			Given I am on the home page
			And I should see "Login"
			When I follow "Login"
			Then I should see "<fieldset>"

			Examples:
			| fieldset 		|
			|	Sign in	 		| 
			|	Email		 		| 
			| Password 		|
			| Remember me |
			| Sign up			|
			| Forgot your password? |

		Scenario: User is not signup
			Given I do not exist as a user
			When I sign in with valid credentials
			Then I see an invalid login message
			And I should be signed out

		Scenario: User signin succesfully
			Given I exist as a user
			And I am not logged in
			When I sign in with valid credentials
			Then I see a successful sign in message
			When I return to the site
			Then I should be signed in


