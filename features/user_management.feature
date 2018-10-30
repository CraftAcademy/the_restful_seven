@javascript
@api_call_main_page
Feature: User Management
  As an editor,
  in order to keep control of who can do what on our site,
  I would like to have admin page where I can change set roles
 
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

  Scenario: An editor can promote/demote a user to a different role [happy path]
    Given I am signed in as "editor@example.com"
    And I visit the user management page
    And I click on the "standard@example.com" user "Edit" button
    And I select "author" from "Role"
    And I click "Update"
    Then I should see "User was successfully updated"
    And I should see "author" within "standard@example.com" row

  Scenario: An editor can delete a user
    Given I am signed in as "editor@example.com"
    And I visit the user management page
    And I click on the "standard@example.com" user "Delete" button
    And I confirm popup
    Then I should see "User was successfully deleted."


  Scenario: A non-editor user cannot access the user management page [sad path]
    Given I am signed in as "author@example.com"
    And I visit the user management page
    Then I should see "You are not authorized to enter"
    And I should be on the main page
   