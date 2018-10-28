@javascript

Feature: Author can add an image to article
    As an author,
    In order to make my articles more appealing,
    I would like to attach an image to the article.

    Background:
    Given the following user is registered
    | email                 | password | role    |
    | standard@example.com  | password | editor  |

    Given the following categories is in the database
        | name      |
        | Inspiring |
        | History   |
        | Science   |

    Given the following articles are in the database
        | title | content  | author | approved | category    |
        | WW2   | Battles  | Snorre | false    | History     |

    Given I am signed in as "standard@example.com"

    Scenario: Author creates an article with an image
        Given I am on the article creation page
        And I fill in "Title" with "My first article"
        And I fill in "Content" with "Content for my first article"
        And I fill in "Author" with "Byggare Bob"
        And I select "History" from "Category"
        And I attach "dummy_image.png" 
        And I click on the "Submit" button
        Then I should see "Article was successfully created."
        And I should see "dummy_image.png" image
        And I should see "My first article"
        And I should see "Content for my first article"
        And I should see "History"  
            
    Scenario: Author wants to edit the article image
        Given I am on the dashboard
        And I click "Edit"
        And I attach "dummy_image.png"  
        And I click on the "Update" button
        Then I should see "Article was successfully updated."
        And I am on the dashboard   