Feature: Admin dashboard

  As an admin,
  In order to manage the website,
  I would like to have an admin dashboard with moderator actions. 

Background: 
  Given the following categories is in the database
  | name      |
  | Inspiring |
  | History   |
  | Science   |

  Given the following articles are in the database
  | title | content  | author | approved | category    |
  | WW2   | Battles  | Snorre | false    | History     |
  | WW3   | Robots   | Snorre | true     | History     | 


  Scenario: Author can see dashboard
    Given I am on the dashboard
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
    Given I am on the dashboard
    And I click the "WW2" link
    And I click the "Edit article" link
    And I fill in "Content" with "Lots of battles!"
    And I click "Update"
    Then I should see "Article was successfully updated."
    And I should see "Lots of battles!"



   