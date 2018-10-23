@javascript @api_call

Feature: Filter feed from news api into categories
    As a visitor,
    In order to view articles within a specific category,
    I would like to filter articles of a specific category within the latest news.

    Background:
        Given I am on the landing page

    Scenario: User should see category specific news when clicking on category menu
        Then I should see "All" button
        And I should see "General" button
        And I should see "Business" button
        And I should see "Entertainment" button
        And I should see "Health" button
        And I should see "Sports" button
        And I should see "Technology" button
        And I click the "Business" button
        Then I should see "something" 
        And I should see "something"