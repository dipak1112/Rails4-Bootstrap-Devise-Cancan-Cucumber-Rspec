Feature: Home Page
	In order to get access home page without login
	A User
	Should be able to display static text

		Scenario Outline: User is not signup and on home page
		Given I am on the home page
		And I should <action> "<fieldset>"
		Examples:
			| action | fieldset | 
			| see 	 | Rails 4 Example |
			| see 	 | Rails4 Bootstrap Devise Cancan Login Sign up Rails 4 Example Following Functionality Included Using Rails 4.0.0 Use Devise with Cancan Cucumber Testing For Devise Rspec Testing For Devise |
			| see 	 | Following Functionality Included Using Rails 4.0.0 |
			| see 	 | Use Devise with Cancan |
			| see 	 | Cucumber Testing For Devise |
			| see 	 | Rspec Testing For Devise |
			| see 	 | Login |
			| see 	 | Sign up |
			| see 	 | Rails4 Bootstrap Devise Cancan |
			| not see| Logout |


