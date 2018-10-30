@javascript
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
    | WW3                | Robots   | Snorre | false     | History     |

  Scenario: Premium user can see list of premium content [Happy path]
    Given I am signed is as "premium@example.com"
    And I visit the main page
    And I click on the "View all Premium Articles" link
    Then I am on the premium articles page
    And I should see "Premium articles"
    And I should see "Selfmade article"
    And I should see "Battles"
    And I should see "Snorre"
    
  Scenario: Premium user reads full premium article [Happy path]
    Given I am signed is as "premium@example.com"
    And I visit the premium articles page
    And I click on the "Read full article" link
    Then I am on the premium article page
    And I should see "Premium articles"
    And I should see "Selfmade article"
    And I should see "Battles"
    And I should see "Snorre"
    And I should see "Back to Premium Articles list"

