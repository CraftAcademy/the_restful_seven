@javascript
Feature: user can purchasea a subscription
    As an Business Owner,
    In order to create revenue,
    I would like the ability to setup a subscription model.

    Scenario: Pay me please
        Given I am on the landing page     
        And I click on the "Signup" button
        Then I should see "Subscribe" within the "1 month subscription" section
        And I should see  "6 month subscription"
        And I should see "12 month subscription"    
