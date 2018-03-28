@launch
Feature: Launch

Scenario: Application Launch
  Given I launch Jupiter application
  Then I should see the following default views after launch
  | media search  |
  | favourites    |
  | video player  |


