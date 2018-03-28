@boards
Feature: Arrival boards
  Scenario Outline: Boards display arrival bookings
    Given An automatic arrival booking has been created with the following attributes
      | Story | Start      | End        |  Details         | Automatic  | Allocated to | Record | From      | Board Display | Rights   | Source | Destination |
      | qa    | now + 1min | now + 2min |  booking details | true       | SQ23 Record  | Yes (R)| freesat2  | show          | BBC News | misc   | misc        |
    When booking is in recording state
    And I navigate to <board> page
    Then <board> displays an entry with the following values
      | Story | Start      | End         |  Title           | Via           | From     | Automatic | Record | Outlet  | Rec  | Status  | AP          | Source | Destination |
      | qa    | now + 1min | now + 2min  |  booking details | Freesat2 sync | freesat2 | true      | true   |  I&A    | true | on-time | SQ23 Record | misc   | misc        |
    And status updates to complete once recording has finished

    Examples: of board
      | board           |
      | arrival board   |
      | arrival plasma  |
      | now & next      |
      | bookings today  |
      | todays bookings |

  Scenario Outline: Boards display crash recordings
    Given A crash recording has been created with the following attributes
      | Story | Start      | End        |  Details         | Automatic  | Allocated to | Record | From      | Board Display | Rights   | Source | Destination |
      | qa    | now + 1min | now + 2min |  booking details | true       | SQ23 Record  | Yes (R)| freesat2  | show          | BBC News | misc   | misc        |
    When booking is in recording state
    And I navigate to <board> page
    Then <board> displays an entry with the following values
      | Story | Start      | End         |  Title           | Via           | From     | Automatic | Record | Outlet  | Rec  | Status  | AP          | Source | Destination |
      | qa    | now + 1min | now + 2min  |  booking details | Freesat2 sync | freesat2 | true      | true   |  I&A    | true | on-time | SQ23 Record | misc   | misc        |
    And status updates to complete once recording has finished

    Examples: of board
      | board           |
      | arrival board   |
      | arrival plasma  |
      | now & next      |
      | bookings today  |

  Scenario Outline: Boards display bookings created via JEX
    Given A JEX file ingest has started with the following attributes
      | Story | Start      | End        |  Details         | Automatic  | Allocated to | Record | From      | Board Display | Rights   | Source | Destination |
      | qa    | now + 1min | now + 2min |  booking details | true       | SQ23 Record  | Yes (R)| freesat2  | show          | BBC News | misc   | misc        |
    When booking is in recording state
    And I navigate to <board> page
    Then <board> displays an entry with the following values
      | Story | Start      | End         |  Title           | Via           | From     | Automatic | Record | Outlet  | Rec  | Status  | AP          | Source | Destination |
      | qa    | now + 1min | now + 2min  |  booking details | Freesat2 sync | freesat2 | true      | true   |  I&A    | true | on-time | SQ23 Record | misc   | misc        |
    And status updates to complete once recording has finished

    Examples: of board
      | board       |
      | recent JEX  |
      | JEX today   |
      | file plasma |
