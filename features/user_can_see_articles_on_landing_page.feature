@javascript @api_call

Feature: Setting up news feed from API
    As a business owner,
    In order to display many articles,
    I would like to source third party articles.

    Background:
        Given I am on the landing page

    Scenario: User should see articles from news_api
        Then I should see "Top News"
        And I should see '.article-title' element
        And I should see '.article-content' element
        And I should see '.article-agency' element

    Scenario: User should see a top news item from news_api
        Then I should see "Latest News"
        And I should see '.top-article-title' element
        And I should see '.top-article-content' element
        And I should see '.top-article-agency' element