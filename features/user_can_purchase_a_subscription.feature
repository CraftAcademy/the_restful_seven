@javascript
Feature: user can purchasea a subscription
    As an Business Owner,
    In order to create revenue,
    I would like the ability to setup a subscription model.

    Scenario: User would like to sign up for a subscription service
        Given I am on the Sign up page     
        And I click the "Subscribe" button within the 1 month subscription section
        Then I should be on the Subscription page   
        And I fill in the Stripe form
        And I should be redirected to the landing page
        
