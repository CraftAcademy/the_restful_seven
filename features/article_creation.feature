Feature: Article creation page
  As an author,
  In order to produce content,
  I would like a form page where I can create an article.

    Scenario: Author enters page and creates an article
      Given I am on the article creation page
      And I fill in "Title" with "My first article"
      And I fill in "Content" with "Content for my first article"
      And I fill in "Author" with "Byggare Bob"
      And I click "Submit"
      Then I should see "Article was successfully created."
      And I should see "My first article"
      And I should see "Content for my first article"
      
    Scenario: Author does not enter title for article [sad path]
      Given I am on the article creation page
      And I fill in "Content" with "Content for my first article"
      And I fill in "Author" with "Byggare Bob"
      And I click "Submit"
      Then I should see "Title can't be blank"