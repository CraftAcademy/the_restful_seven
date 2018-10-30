@javascript
@api_call_main_page

Feature: Filter feed from news api into categories
    As a visitor,
    In order to view articles within a specific category,
    I would like to filter articles of a specific category within the latest news.

    Background:
        Given I am on the landing page
    
    @api_call_sports 
    Scenario: User selects sports and sees relevant news
        When I select "Sports" from "category"
        Then I should see "Peter Brackley: Former BBC Radio Sport broadcaster and commentator dies aged 67" within the "Latest News" section
        And I should see "BBC Young Sports Personality of the Year 2018: Top 10 revealed"
        And I should see "Read the full story" link

    @api_call_business 
    Scenario: User selects business and sees relevant news 
        When I select "Business" from "category"
        Then I should see "Brazil economy: Can Bolsonaro ride the 'Bullsonaro wave"
        And I should see "Businesses and markets are embracing Jair Bolsonaro; but his policies are vague and untested."
        And I should see "Read the full story" link