#@javascript
@api_call_main_page
Feature: User roles
  As a site owner,
  in order to ensure the security of my website and the quality of its content,
  I would like the users to have different roles depending on their access privileges

  Background:
    Given the following user is registered
    | email                 | password | role           |
    | standard@example.com  | password | standard_user  |
    | premium@example.com   | password | premium_user   |
    | author@example.com    | password | author         |
    | editor@example.com    | password | editor         |

    Given the following categories is in the database
    | name      |
    | Inspiring |
    | History   |
    | Science   |

    Given the following articles are in the database
    | title              | content  | author | approved  | category    |
    | Selfmade article   | Battles  | Snorre | true      | History     |
    | WW3                | Robots   | Snorre | false     | History     |

  Scenario: Normal user can only see articles from API [Happy path]
    Given I am signed in as "standard@example.com"
    And I visit the main page
    Then I should see "Top News"
    And I should see '.top-article-title' element
    And I should see 'Hurricane Michael erases beach town like'
  
  Scenario: Normal user cannot see our articles from the database [Sad path]
    Given I am signed in as "standard@example.com"
    And I visit the main page
    Then I should not see "Selfmade article"
    
  Scenario: Premium user should see premium content [Happy path]
    Given I am signed in as "premium@example.com"
    And I visit the main page
    And I should see "Premium content"
    And I should see "WW3"
    And I should see "Robots"
    And I should see "Snorre"

  Scenario: Premium user should not see dashboard [Sad path]
    Given I am signed in as "premium@example.com"
    And I visit the dashboard
    Then I should see "You are not authorized to enter"
    And I should see "Premium content"

  Scenario: Author user can create an article [Happy path]
    Given I am signed in as "author@example.com"
    And I am on the article creation page
    And I fill in "Title" with "My first article"
    And I fill in "Content" with "Content for my first article"
    And I fill in "Author" with "Byggare Bob"
    And I select "History" from "Category"
    And I click on the "Submit" button
    Then I should see "Article was successfully created."
    And I should see "My first article"
    And I should see "Content for my first article"
    And I should see "History"
    
  
  Scenario: Author does not enter title for article [sad path]
    Given I am signed in as "author@example.com"
    Given I am on the article creation page
    And I fill in "Content" with "Content for my first article"
    And I fill in "Author" with "Byggare Bob"
    And I click on the "Submit" button
    Then I should see "Title can't be blank"
  
  Scenario: Author does not enter title for article [sad path]
    Given I am signed in as "author@example.com"
    And I visit the dashboard
    And I click on "WW3" article "Edit" button
    Then I should not see "Approved"

