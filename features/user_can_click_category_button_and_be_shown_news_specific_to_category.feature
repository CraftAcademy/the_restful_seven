@javascript @api_call

Feature: Filter feed from news api into categories
    As a visitor,
    In order to view articles within a specific category,
    I would like to filter articles of a specific category within the latest news.

    Background:
        Given the following categories exist
        | name      |
        | Inspiring |
        | History   |
        | Science   |

    Scenario: User should see category specific news when clicking on category menu
        When I click the "categories" button
        Then I should see "Inspiring" button
        And I should see "History" button
        And I should see "Science" button
        And I click the "Inspiring" button
        Then I should see "something" 
        And I should see "something"