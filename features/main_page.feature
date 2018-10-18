Feature: Main Page Layout
  As a user,
  In order to view content,
  I would like to view articles.

  Scenario: A user wants to view content
   Given I visit the main page
    Then I should see "The Restful News" 
    And I should see "Breaking News"   
    And I should see "News feed"
    And I should see "Subscribe"
    And I should see "Latest comments"
    And I should see "Highest rated articles"
   
 