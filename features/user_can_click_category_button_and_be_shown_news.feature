@javascript
@api_call_main_page


Feature: Filter feed from news api into categories
    As a visitor,
    In order to view articles within a specific category,
    I would like to filter articles of a specific category within the latest news.

    Background:
        Given I am on the landing page
    
    @api_call_sports 
    Scenario: User should see category specific news when clicking on category menu
        When I select "Sports" from "category"
        Then I should see "Peter Brackley: Former BBC Radio Sport broadcaster and commentator dies aged 67" within the "Latest News" section
        And I should see "BBC Young Sports Personality of the Year 2018: Top 10 revealed"
        And I should see "Read the full story" link

    @api_call_business 
    Scenario: asdasdasd
        When I select "Business" from "category"
        Then I should see "something stubbed"
        And I should see "something stubbed"