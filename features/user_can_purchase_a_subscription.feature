@javascript
Feature: user can purchasea a subscription
    As an Business Owner,
    In order to create revenue,
    I would like the ability to setup a subscription model.

    Scenario: User would like to sign up for a subscription service
        Given I am on the landing page     
        And I click on the "Signup" button
        Then I should see "Subscribe" button within the "1 month subscription" section
        And I should see "6 month subscription"
        And I should see "12 month subscription"    
