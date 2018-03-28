@arrival_booking
Feature: Arrival Bookings

  Background:
    Given Jupiter is launched

  @todo
  Scenario: Arrival booking dialog can be opened from new menu
    Given I select the new menu
    Then I should see arrival booking option in menu list
    When I select new arrival booking menu item
    Then New arrival booking dialog should open
    And the following should be present in new arrival booking dialog
      | Zone select           |
      | Start time selector   |
      | End time selector     |
      | Record selector       |
      | Allocation selector   |
      | Story selector        |
      | Details input field   |
      | Description text area |
      | Rights selector       |
      | Source input field    |
      | Copyright selector    |
      | Ok button             |
      | Cancel button         |

  @todo
  Scenario: Arrival booking dialog can be opened from tasks menu
    Given I select the tasks menu
    And I expand 'New' tree item
    Then I should see new arrival booking option in tree list
    When I select new arrival booking tree item
    Then New arrival booking dialog should open
    And the following should be present in new arrival booking dialog
      | Zone select           |
      | Start time selector   |
      | End time selector     |
      | Record selector       |
      | Allocation selector   |
      | Story selector        |
      | Details input field   |
      | Description text area |
      | Rights selector       |
      | Source input field    |
      | Copyright selector    |
      | Ok button             |
      | Cancel button         |

  Scenario: Arrival booking dialog can be opened from search results toolbar
    Given I open booking search
    And I click booking search button
    When I select new booking dropdown
    And I select new arrival booking from new booking dropdown
    Then New arrival booking dialog should open
    And the following should be present in new arrival booking dialog
      | Zone select           |
      | Start time selector   |
      | End time selector     |
      | Record selector       |
      | Allocation selector   |
      | Story selector        |
      | Details input field   |
      | Description text area |
      | Rights selector       |
      | Source input field    |
      | Copyright selector    |
      | Ok button             |
      | Cancel button         |

  Scenario Outline: Closing arrival booking dialog
    Given Arrival booking dialog is open
    Then Arrival booking dialog can be closed via <option>

    Examples:
      | option              |
      |  Cancel ctrl        |
      |  System Close ctrl  |

  Scenario: Arrival bookings title validation
    Given Arrival booking dialog is open
    And both story and detail fields are left blank
    When Arrival booking OK button is clicked
    Then Booking error alert is displayed

  @todo
  Scenario Outline: Arrival booking can be created
    Given I open arrival booking dialog
    And I set the following values for a new arrival booking
      | story | details         | description         | Automatic   | Allocated to | Source        | Rights   | Primary |
      | news  | booking details | booking description | <automatic> | z1           | Freesat1 Sync | BBC News | News    |
    When I click OK button
    Then new arrival booking dialog closes
    And new booking with the following attributes can be seen in the results pane
      | story | title              | status   | AB   | Via           | Story | Outlet | Copyright  | Description         | Primary |
      | news  | booking description| on-time  | true | Freesat1 sync | news  | News   | News       | booking description | News    |

    Examples:
      | automatic   |
      | true        |
      | false       |

  Scenario: New arrival booking present in booking search
    Given a new arrival booking is created with the following attributes
      | story | details         | description         | Automatic   | Allocated to | Source        | Rights   | Primary | Start           | End              |
      | news  | booking details | booking description | true        | Record       | Freesat2 Sync | BBC News | News    | 1 mins from now | 2 mins from now  |
    When booking search is made
    Then new arrival booking is present in booking search results with the following attributes
      | Type     | Start                | Description         | Auto | Via           | Copyright | Primary | Start           | End              |
      | arrival  | specified start time | booking description | True | Freesat2 Sync | BBC News  | News    | 1 mins from now | 2 mins from now  |

  @manual
  Scenario: Automatic arrival booking starts and stops at given time
    Given an arrival booking is created with the following attributes
      | story | details         | description         | Automatic   | Allocated to | Source        | Rights   | Primary | Start           | End              |
      | news  | booking details | booking description | true        | Record       | Freesat2 Sync | BBC News | News    | 5 mins from now | 10 mins from now |
    Then arrival booking begins recording at specified start time
    And arrival booking stops recording at specified end time
    And arrival booking can be played back in full inside QVL

  Scenario Outline: New arrival booking time and date field validation
    Given Arrival booking dialog is open
    When Invalid <option> is entered
    Then Invalid <option> alert is displayed
    And Invalid <option> alert can be closed

    Examples:
      | option      |
      | Start Time  |
      | End Time    |
      | Start Date  |
      | End Date    |

  Scenario Outline: New arrival booking end time/date validation
    Given Arrival booking dialog is open
    When I enter a <option> value which is before start time
    Then 'Start and End date' booking error alert is displayed

    Examples:
      | option      |
      | End Time    |
      | End Date    |

  Scenario: Arrival booking can be amended
    Given an arrival booking is loaded in QVL
    When description tab is selected
    Then media view is presented
    When 'details' and 'description' fields are amended
    And media view is saved
    Then reloading search results shows arrival booking with new details
