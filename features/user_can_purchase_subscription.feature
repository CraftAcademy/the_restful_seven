@javascript @api_call_main_page

Feature: User can purchase a subscription
    As an Business Owner,
    In order to create revenue,
    I would like the ability to setup a subscription model.

    Background: Logged in
    Given the following user is registered
        | email                 | password | role           |
        | standard@example.com  | password | standard_user  |

    Scenario: Logged in user wants to upgrade to Premium
        Given I am signed in as "standard@example.com"
        And I visit the main page
        And I click on the "Subscribe" button
        Then I should be on the Subscription page
        And I click "Subscribe" button within the 1 Month Subscription section
        And I fill in the stripe form
        
