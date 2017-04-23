Feature: Projects
  In order to get things done
  As a project-list freak
  I want to be able to create a list of projects.

  Scenario: Create a project
    Given I am on page of the projects
    And I go to "New Project"
    When I fill in "project[name]" with "My first project!"
    And I press "Create Project"
    Then I should see "My first project!"
