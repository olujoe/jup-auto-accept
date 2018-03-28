@Cliplist

Feature: Cliplist
  Scenario Outline: Items can be added to cliplist when cliplist is opened or closed
    Given I add an item to my cliplist via <action>
    And Cliplist is <cliplist_state>
    When I view the cliplist
    Then cliplist displays new item at the top of the list with the following

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

    Examples: of action and cliplist_state
      | action                              | cliplist_state  |
      | Media Search RCA 'add to cliplist'  | closed          |
      | QVL Toolbar                         | closed          |
      | QVL RCA 'add to cliplist'           | closed          |
      | WIP RCA 'add to cliplist'           | closed          |
      | Media Search RCA 'edit'             | closed          |
      | Media Search RCA 'add to cliplist'  | open            |
      | QVL Toolbar                         | open            |
      | QVL RCA 'add to cliplist'           | open            |
      | WIP RCA 'add to cliplist'           | open            |
      | Media Search RCA 'edit'             | open            |

  Scenario Outline: Items can be removed from cliplist
    Given I have items in my cliplist
    When I remove a cliplist item via <action>
    Then Selected item is removed from cliplist

    Examples: Of action
      | action          |
      | Keyboard Delete |
      | RCA 'remove'    |

  Scenario: Cliplist columns can be resized
    Given I have items in my cliplist
    When I resize cliplist columns
    Then Cliplist columns resize appropriately

  Scenario: Cliplist columns can be reordered
    Given I have items in my cliplist
    When I reorder cliplist columns
    Then Cliplist columns are reordered
    And Cliplist items are still displayed correctly
