@api_call_main_page
Scenario: User can purchase a subscription
    As an Business Owner,
    In order to create revenue,
    I would like the ability to setup a subscription model.

    Background: Logged in
    Given the following user is registered
        | email                 | password | role           |
        | standard@example.com  | password | standard_user  |

    Scenario: Logged in user wants to upgrade to Premium
        Given I am signed is as "standard@example.com"
        And I visit the main page
        And I click the "Subscribe" button
        Then I should be on the subscribe page
        And I click "Subscribe" button within the "1 Month Subscription" section
        And I fill in the stripe form
        
