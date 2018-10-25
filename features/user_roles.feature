Feature: User roles
  As a site owner,
  in order to ensure the security of my website and the quality of its content,
  I would like the users to have different roles depending on their access privileges

  Background:
    Given the following users is in the database
    ||||||

  Scenario: Normal user
    # Happy path: Can only log in and see the same as a logged in user
    # Sad path: Cannot see premium stories
  Scenario: Premium user
    # Happy path: Can see premium articles
    # Sad path: Cannot see dashboard

  Scenario: Author user
    # Happy path: Can create an article
    # Sad path: Cannot approve an article

  Scenario: Editor user
    # Can create and approve articles
   