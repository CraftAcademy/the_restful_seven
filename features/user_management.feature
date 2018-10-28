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


  Scenario: An editor can promote/demote a user to a different role
   Given I am signed is as "editor@example.com"
   And I visit the user management page
   And I click on the "standard@example.com" user "edit" button
   And I select "author" in "role" list
   And I click "Update"
   Then I should see "User role was successfully updated"
   And I should see "author" within "standard@example.com" row

  


  Scenario: A non-editor user cannot access the user management page
   