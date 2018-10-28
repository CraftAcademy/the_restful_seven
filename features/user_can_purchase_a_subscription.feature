@javascript
Feature: user can purchasea a subscription
    As an Business Owner,
    In order to create revenue,
    I would like the ability to setup a subscription model.

    Scenario: User would like to sign up for a subscription service
        Given I am on the Sign up page     
        And I click "Subscribe" button within the "1 month subscription" section
        Then I should be on the Subscription page
        And I fill in "Email" with "email@email.com"
        And I fill in "Password" with "password"
        And I fill in "Password confirmation" with "password"    
        And I fill in the Stripe form
        
