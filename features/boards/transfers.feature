Feature: Transfer Boards

  Scenario Outline: Boards display arrival booking transfers
    Given An arrival booking is created with the following attributes on a site which is NOT the test site
      | Story | Start      | End        |  Details         | Automatic  | Allocated to | Record | From      | Board Display | Rights   | Source | Destination |
      | qa    | now + 1min | now + 2min |  booking details | true       | SQ23 Record  | Yes (R)| freesat2  | show          | BBC News | misc   | misc        |
    When arrival booking is transferred to test site
    And I navigate to <board> page
    Then <board> displays the transferred item with the following attributes
      | CB  | Story | Start      | End         |  Title           | Status   | Source  | Destination | User     |
      | S2S | qa    | now + 1min | now + 2min  |  booking details | Complete | on-time | misc        | username |

    Examples: of board
      | board                       |
      | transfers in now & recent   |
      | transfers in 12hrs  history |
      | site to site today          |

  Scenario: Transfers: main sites
    Given I navigate to Transfers main site board
    Then I see active transfers for the following sites
      | West 1    |
      | Salford   |
      | Millbank  |
      | Cardiff   |
    And each active transfer displays the following information
      | Start     |
      | End       |
      | User      |
      | Title     |
      | Source    |
      | Dest      |
      | Status    |
      | Priority  |

  Scenario: Transfers:  monitoring
    Given high, normal and low priority items are all being transferred
    When I navigate to transfers board
    Then I see all deliveries in progress
    And each in progress delivery has the following
      | Title    |
      | Duration |
      | Status   |
      | Rem      |
    And each in progress delivery has the correct indicator according to its priority
      | Item Priority | Indicator        |
      | High          | Yellow up arrow  |
      | Normal        | No arrow         |
      | Low           | Blue down arrow  |

  Scenario: Configurable Transfers
    Given A transfer is happening for a custom site
    When I navigate to Configurable Transfers page
    And I select custom site from the site dropdown
    And I click add site to page button
    Then I see all transfers for custom site appear at the top of the page

  Scenario Outline: Configurable Transfers Board row and refresh selection
    Given I navigate to Configurable Transfers page
    And I select a custom site
    And I select a row count of <row_count> and a page refresh of <refresh_period>
    When I click add site to page button
    Then I see a maximum of <row_count> active transfers for custom site
    And page refreshes every <refresh_period> adding or removing transfers accordingly

    Examples: of row count
      | row_count| refresh_period |
      | 3        | 1 minute       |
      | 21       | 15 seconds     |
