Feature: Archive and Shelf summary boards

  Scenario: Archive - Master Outlets Summary
    Given media items from multiple different parent and child outlets have been archived
    When I navigate to editorial and archive summary board
    Then I should see 'Archive of Master Outlet Media' table
    And table should display the following values for master outlets only
      | Outlet Name |
      | Hours       |
      | Items       |
    And table should display a total count for 'Hours' and 'Items'

  Scenario: Archive - Individual Outlets Summary
    Given media items from multiple different parent and child outlets have been archived
    When I navigate to editorial and archive summary board
    Then I should see 'Archive of Individual outlets' table
    And table should display the following values for all outlets
      | Outlet Name |
      | Hours       |
      | Items       |
    And table should display a total count for 'Hours' and 'Items'

  Scenario: Editorial Shelf - Master Outlets Summary
    Given media items from multiple different parent and child outlets have been shelved
    When I navigate to editorial and archive summary board
    Then I should see 'Editorial-Shelf use by Master Outlets' table
    And table should display the following values for master outlets only
      | Outlet Name |
      | Hours       |
      | Items       |
    And table should display a total count for 'Hours' and 'Items'

  Scenario: Editorial Shelf - Outlets Summary
    Given media items from multiple different parent and child outlets have been shelved
    When I navigate to editorial and archive summary board
    Then I should see 'Archive of individual outlets' table
    And table should display the following values for all outlets
      | Outlet Name |
      | Hours       |
      | Items       |
    And table should display a total count for 'Hours' and 'Items'
