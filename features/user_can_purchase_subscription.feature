@javascript 
@api_call_main_page

Feature: User can purchase a subscription
    As an Business Owner,
    In order to create revenue,
    I would like the ability to setup a subscription model.

    Background: Logged in
    Given the following user is registered
    | email                 | password | role           |
    | standard@example.com  | password | standard_user  |

    Given the following categories is in the database
    | name      |
    | Inspiring |
    | History   |
    | Science   |

    Given the following articles are in the database
    | title              | content  | author | approved  | category    |
    | Selfmade article   | Battles  | Snorre | true      | History     |
    | WW3                | Robots   | Snorre | false     | History     |


    @api_call_stripe
    Scenario: Logged in user wants to upgrade to Premium [happy path]
        Given I am signed in as "standard@example.com"
        And I visit the main page
        And I click on the "Subscribe" button        
        Then I should be on the Subscription page
        Then wait 1 seconds      
        And I fill in the Stripe form with 'valid' credentials
        Then wait 1 seconds
        Then I should be redirected to the landing page
        Then I should see "Welcome as a subscriber"

    @api_call_stripe
    Scenario: Logged in user tries to pay with invalid credentials [sad path]
        Given I am signed in as "standard@example.com"
        And I visit the main page
        And I click on the "Subscribe" button
        Then I should be on the Subscription page
        Then wait 1 seconds
        And I fill in the Stripe form with 'invalid' credentials
        Then wait 1 seconds
        Then I should be on the Subscription page
        And I should see "Your card was declined"
