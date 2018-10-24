@javascript @api_call

Feature: User can log-in

    Background:
        Given the following user is registered
            | email         | password   | password_confirmation |
            | sad@path.com  | password   | password              |   

    Scenario: Registered user successfully login
        Given I am on the landing page
        And I click on the 'Login' button
        Then I am on the Log in page
        And I fill in 'Email' with 'email@email.com'
        And I fill in 'Password' with 'mypassword'
        And I click on the 'Log in' button
        Then I see the message 'Signed in successfully.'



