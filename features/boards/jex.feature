Feature: JEX Export boards
  Scenario Outline: 'JEX Exports' board displays both arrival bookings and crash recordings
    Given A <media_type> was exported previous to today
    When I export a <media_type> media item
    And I navigate to 'JEX Exports' board
    Then Only todays exports are displayed
    And Each export should display the following
      | Start Time  |
      | End Time    |
      | Story Name  |
      | Title       |
      | Source      |
      | Destination |
      | Status      |

    Examples: Of media_type
      | media_type      |
      | arrival booking |
      | crash recording |

  Scenario: 'JEX Today' board displays ingests from agency drop locations
    Given A media item was ingested previous to today
    When I ingest a media item via agency drop folder
    And I navigate to 'JEX Today' board
    Then Only todays ingests are displayed
    And Each ingest item should display the following
      | Agency Name |
      | Media Name  |

  Scenario: 'Recent Today' board displays ingests from agency drop locations
    Given I ingest a media item via agency drop folder
    And I navigate to 'JEX Today' board
    Then Only todays ingests are displayed
    And Each ingest item should display the following
      | CB   | START                 | End                  | Story                   | Title               | Source      | Status   |
      | File | Start time of booking | End time for booking | Agency name i.e Reuters | Title of media item | Agency name | Complete |
