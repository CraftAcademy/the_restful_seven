Feature: Admin dashboard

  As an admin,
  In order to manage the website,
  I would like to have an admin dashboard with moderator actions

Background:
  Given the following user is registered
    | email                 | password | role           |
    | author@example.com    | password | author         |
    | editor@example.com    | password | editor         |

  Given the following categories is in the database
  | name      |
  | Inspiring |
  | History   |
  | Science   |

  Given the following articles are in the database
  | title | content  | author | approved | category    |
  | WW2   | Battles  | Snorre | false    | History     |
  | WW3   | Robots   | Snorre | true     | History     | 


  Scenario: Author can see dashboard contents
    Given I am signed is as "author@example.com"
    And I am on the dashboard
    Then I should see "Dashboard"
    And I should see "WW2"
    And I should see "WW3"
    And I should see "Battles"
    And I should see "Robots"
    And I should see "Snorre"
    And I should see "Approved"
    And I should see "true"
    And I should see "false"

  Scenario: Author can edit articles
    Given I am signed is as "author@example.com"
    Given I am on the dashboard
    And I click "WW2" 
    And I click "Edit article" 
    And I fill in "Content" with "Lots of battles!"
    And I click "Update"
    Then I should see "Article was successfully updated."
    And I should see "Lots of battles!"

  Scenario: Author can delete an article
    Given I am signed is as "author@example.com"
    Given I am on the dashboard
    And I click "WW2" 
    And I click "Delete article" 
    Then I should see "Article was successfully deleted."
    And I should not see "WW2"

  Scenario: Editor can approve articles
    Given I am signed is as "editor@example.com"
    And I am on the dashboard
    And I click on "WW2" article "Edit" button
    And I click the "Approved" checkbox
    And I click on the "Update" button
    Then I should see "Article was successfully updated."
    And I should see "true" on the "WW2" article
  



   