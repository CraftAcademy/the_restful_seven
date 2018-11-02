@api_call_main_page
Feature: Premium content page
  As a premium subscriber,
  in order to get best value for my money,
  I would like a page where I can read all available premium

  Background:
    Given the following user is registered
    | email                 | password | role           |
    | premium@example.com   | password | premium_user   |

    Given the following categories is in the database
    | name      |
    | Inspiring |
    | History   |
    | Science   |

    Given the following articles are in the database
    | title              | content  | author | approved  | category    |
    | Selfmade article   | Battles  | Snorre | true      | History     |
    | WW3                | Robots   | Snorre | true      | History     |  

    Given I am signed in as "premium@example.com"

  Scenario: Premium user can see list of premium content [Happy path]
    And I visit the main page
    And I click "View all Premium Articles"
    Then I am on the premium articles page
    And I should see "Premium Articles page"
    And I should see "Selfmade article"
    And I should see "Battles"
    
  Scenario: Premium user reads full premium article [Happy path]
    And I visit the premium articles page
    And I click on "Selfmade article" article "Read full article" link
    Then I am on the premium article page "Selfmade article"
    And I should see "Selfmade article"
    And I should see "Battles"
    And I should see "Back to Premium Articles list" link
