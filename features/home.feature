Feature: Home
  As a product manager
  I want our users to be greeted when they visit our site
  So that they have a better experience

  Scenario: User sees on the home page and see title
    When I go to the homepage
    Then I should see the demo title
