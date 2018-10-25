@api_call_business @api_call_sports @api_call_main_page


Feature: Filter feed from news api into categories
    As a visitor,
    In order to view articles within a specific category,
    I would like to filter articles of a specific category within the latest news.

    Background:
        Given I am on the landing page

    Scenario: User should see category specific news when clicking on category menu
        When I select "Sports" from "category"
        Then I should see "Hyderabad homes and pavements made from used plastic bags" within the "Latest News" section
        And I should see "Businesses in India may have found a way to turn plastic rubbish into a golden business opportunity."
        And I should see "Read the full story" link

    Scenario: asdasdasd
        When I select "Business" from "category"
        Then I should see "something stubbed"
        And I should see "something stubbed"