Feature: Setting up news feed from API
    As a business owner,
    In order to display many articles,
    I would like to source third party articles.

    Background: 
        Given I am on the landing page

    Scenario: User should see articles from news_api
        Then I should see "Latest News"
        And I should see '.article-title' element
        And I should see '.article-content' element
        And I should see '.article-author' element
        And I should see '.article-agency' element