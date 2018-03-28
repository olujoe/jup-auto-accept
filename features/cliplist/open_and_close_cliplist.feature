@cliplist

Feature: Cliplist
  Scenario Outline: Cliplist can be opened when user has cliplist items
    Given I have items added to my cliplist
    And Cliplist is not open
    When I open cliplist via <action>
    Then Cliplist opens displaying the following for each item

      | Status Image (A)          |
      | Clip Name                 |
      | Duration                  |
      | Status                    |
      | Outlet                    |
      | Traffic Light Status (TL) |
      | Copyright                 |
      | Description               |
      | RO Time                   |
      | CreationDateTime          |

    Examples: Of action
      | action            |
      | Tasks Menu        |
      | F5 Shortcut Key   |
      | Favourites Button |

  Scenario Outline: Cliplist can be opened when user has no cliplist items
    Given I have no items in my cliplist
    And Cliplist is not open
    When I open cliplist via <action>
    Then Cliplist opens with no items

    Examples: Of action
      | action            |
      | Tasks Menu        |
      | F5 Shortcut Key   |
      | Favourites Button |

  Scenario Outline: Cliplist can be closed
    Given I have items added to my cliplist
    And Cliplist is open
    When I close cliplist via <action>
    Then Cliplist closes

    Examples: Of action
      | action              |
      | Cliplist close icon |
      | F5 Shortcut Key     |

  Scenario Outline: Cliplist can be reopened
    Given I have items added to my cliplist
    And Cliplist is open
    When I close cliplist
    Then I open cliplist via <action>
    Then Cliplist opens displaying the following for each item

      | Status Image (A)          |
      | Clip Name                 |
      | Duration                  |
      | Status                    |
      | Outlet                    |
      | Traffic Light Status (TL) |
      | Copyright                 |
      | Description               |
      | RO Time                   |
      | CreationDateTime          |

    Examples: Of action
      | action          |
      | Tasks Menu      |
      | F5 Shortcut Key |