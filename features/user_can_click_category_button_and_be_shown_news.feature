Feature: Filter feed from news api into categories
    As a visitor,
    In order to view articles within a specific category,
    I would like to filter articles of a specific category within the latest news.

    Background:
        Given I am on the landing page

    @api_call_sports
    Scenario: User should see category specific news when clicking on category menu
        When I select "Sports" from "category"
        Then I should see "Hyderabad homes and pavements made from used plastic bags" within the "Latest News" section
        And I should see "Businesses in India may have found a way to turn plastic rubbish into a golden business opportunity."
        And I should see "Read the full story" link

    @api_call_business
    Scenario: asdasdasd
        When I select "Business" from "category"
        Then I should see "something stubbed"
        And I should see "something stubbed"