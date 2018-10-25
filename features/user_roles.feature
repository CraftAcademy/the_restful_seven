Feature: User roles
  As a site owner,
  in order to ensure the security of my website and the quality of its content,
  I would like the users to have different roles depending on their access privileges

  Background:
    Given the following users is in the database
    | email               | password | role         |
    | user@example.com    | password | user         |
    | premium@example.com | password | premium_user |
    | author@example.com  | password | author       |
    | editor@example.com  | password | editor       |

    Given the following categories is in the database
    | name      |
    | Inspiring |
    | History   |
    | Science   |

    Given the following articles are in the database
    | title              | content  | author | approved | category    |
    | Selfmade article   | Battles  | Snorre | false    | History     |
    | WW3                | Robots   | Snorre | true     | History     |

  Scenario: Normal user can only see articles from API
    Given I am signed in as "user@example.com"
    And I visit the main page
    Then I should see "Latest News"
    And I should see '.article-title' element
    And I should see '.article-content' element
    And I should see '.article-agency' element
    And I should see 'Anwar Ibrahim returns to Malaysian politics'
  
  Scenario: Normal user cannot see our articles from the database
    Given I am signed in as "user@example.com"
    And I visit the main page
    Then I should not see "Selfmade article"
    
  Scenario: Premium user
    # Happy path: Can see premium articles
    # Sad path: Cannot see dashboard

  Scenario: Author user
    # Happy path: Can create an article
    # Sad path: Cannot approve an article

  Scenario: Editor user
    # Can create and approve articles
   