Feature: Rights boards

    Background:
      Given arrival booking

    Scenario Outline: Rights summary board display rights information for arrival bookings
      Given An automatic arrival booking has been created with the following attributes
        | Board Display | Rights   | Restrictions         | Destination |
        | Show          | BBC News | Unknown restrictions | BBC News    |
      Given I navigate to rights summary board
      When I select a from date of <from_date>
      And I select a to date of <to_date>
      When I click get results button
      Then only bookings within <from_date> and <to_date> are displayed

      Examples: Of from_date and to_date
       | from_date   | to_date     |
       | yesterday   | today       |
       | 30 days ago | 14 days ago |