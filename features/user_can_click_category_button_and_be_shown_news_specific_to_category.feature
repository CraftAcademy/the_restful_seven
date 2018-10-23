@api_category_call

Feature: Filter feed from news api into categories
    As a visitor,
    In order to view articles within a specific category,
    I would like to filter articles of a specific category within the latest news.

    Background:
        Given I am on the landing page

    Scenario: User should see category specific news when clicking on category menu
        Then I should see "All" 
        And I should see "General" 
        And I should see "Business" 
        And I should see "Entertainment" 
        And I should see "Health" 
        And I should see "Sports" 
        And I should see "Technology" 
        And I click the "Business" button
        Then I should see "Hyderabad homes and pavements made from used plastic bags" 
        And I should see "Businesses in India may have found a way to turn plastic rubbish into a golden business opportunity."