@javascript @api_call_main_page
Feature: User can log-in
    As a visitor,
    In order to gain access to my account,
    I would like to login.

    Background:
        Given the following user is registered
            | email         | password   | 
            | sad@path.com  | password   |        

    Scenario: Registered user successfully login
        Given I am on the landing page
        And I click on the 'Login' button
        Then I am on the Log in page
        And I fill in 'Email' with 'sad@path.com'
        And I fill in 'Password' with 'password'
        And I click on the 'Log in' button
        Then I see the message 'Signed in successfully.'

    Scenario: 'User inputs invalid password [Sad path]'
        Given I am on the landing page
        And I click on the 'Login' button
        Then I am on the Log in page
        And I fill in 'Email' with 'sad@path.com'
        And I fill in 'Password' with 'drowssap'
        And I click on the 'Log in' button
        Then I should see 'Invalid Email or password.'

