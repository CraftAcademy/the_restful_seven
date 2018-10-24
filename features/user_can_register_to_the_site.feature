@javascript @api_call
Feature: Registration 
    As a visitor,
        In order to gain access to premium content,
        I would like to create an account.

    Scenario: Successfull registration as a new user
        Given I am on the landing page     
        And I click on the "Signup" button
        Then I am on the Sign up page
        And I fill in "Email" with "email@email.com"
        And I fill in "Password" with "password"
        And I fill in "Password confirmation" with "password"        
        And I click on the "Sign up" button
        Then I am on the landing page 
        And I see the message "Welcome! You have signed up successfully."
        