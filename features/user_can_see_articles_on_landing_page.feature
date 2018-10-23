@javascript @api_call

Feature: Setting up news feed from API
    As a business owner,
    In order to display many articles,
    I would like to source third party articles.

    Background:
        Given I am on the landing page

    Scenario: User should see articles from news_api
        Then I should see "Top News"
        Then I should see "Hurricane Michael erases beach town like 'mother of all bombs" 
        And I should see "The storm snapped boats in two and knocked over 30-ton freight rail cars like toys."
        And I should see "Read the full story" link

    Scenario: User should see a top news item from news_api
        Then I should see "Latest News"
        Then I should see "Ryder Cup 2018: Why we should all be excited about Tiger's return" 
        And I should see "BBC Sport looks at the reasons why golf fans around the world are relishing the return of Tiger Woods to Ryder Cup action."
        And I should see "Read the full story" link