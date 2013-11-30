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


