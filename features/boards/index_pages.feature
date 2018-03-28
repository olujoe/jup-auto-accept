@boards
Feature: Arrival board index pages

  Scenario: Board Index
    Given I navigate to the board links page
    Then I should see the following links with descriptions :

      | Link                             | Description                                                                         |
      | Arrival Board                    | Arrival Board of combined incoming feeds, files and  agency (in the last 5 minutes) |
      | File Arrival Board               | File arrivals                                                                       |
      | Arrival Boards Index             | Further options                                                                     |
      | Delivery Boards Index            | Delivery monitoring                                                                 |
      | Transfers (main sites)           | Snapshot of current state across main sites (non updating, use refresh)             |
      | Transfers (configurable)         | Customisable Transfer monitoring page                                               |
      | Summary Archive+Shelf            | Shows summary of Archive and Editorial Shelf                                        |
      | Shelf Use by Outlet              | Shows current use of shelf by Outlet                                                |
      | Shelf Use for Archive            | Shows current use of Archive Shelf with weekly history                              |
      | Editors in use                   | Editors in operation, started by Jupiter                                            |
      | JOE Restores Report              | JOE/JLIB Restores Report                                                            |
      | JOE Performance (Monthly) Report | JOE/JLIB Performance Report                                                         |
      | JOE Monitoring Page              | JOE/JLIB Monitoring Page                                                            |

  Scenario: Arrival Board Index
    Given I navigate to the arrival board index page
    Then I should see the following links with descriptions :

      | Link                      | Description                                                                                                                  |
      | Arrival Plasma            | Arrival Bookings in progress now and in the next 2 hours; File arrivals in the last 15 minutes; agency in the last 5 minutes |
      | File Plasma               | File arrivals                                                                                                                |
      | Now & Next                | Arrival Bookings (non updating)                                                                                              |
      | Bookings Today            | Arrival Bookings Today (non updating)                                                                                        |
      | Recent JEX                | JEX Arrivals today                                                                                                           |
      | JEX Today                 | JEX Arrivals today                                                                                                           |
      | JEX Exports               | Recent files exported via JEX                                                                                                |
      | Recent JFE                | Files sent in via JFE                                                                                                        |
      | JFE Today                 | JFE today                                                                                                                    |
      | Transfers In Now & Recent | Site-to-Site Arrivals in-progress and recent 30 minutes of history (non updating, use refresh)                               |
      | Transfers In 2hr History  | Site-to-Site Arrivals 12 hour history (non updating, use refresh)                                                            |
      | Transfers Out 2hr History | Site-to-Site Departures 12 hour history (non updating, use refresh)                                                          |
      | Site-to-Site Today        | Site-to-Site Arrivals which have completed today                                                                             |
      | Site-to-Site Today        | Site-to-Site Arrivals which have completed today                                                                             |

  Scenario: Delivery Board Index
    Given I navigate to the delivery board index page
    Then I should see the following links
      | All delivery queues       |
      | Online                    |
      | QA Raven                  |
      | Update the list of queues |

   Scenario: Rights index board
     Given I navigate to the rights index board
     Then I should see the following links with descriptions :
       | Link                     | Description                                                                    |
       | Reviews coming up        | The number of items which will be reaching their review date ...               |
       | Item Re-use              | List of items being re-used to make other items                                |
       | Summary archive + shelf  | Shows summary of archive and editorial shelf                                   |
       | Shelf use by outlet      | Shows current use of shelf by outlet                                           |
       | Shelf use for archive    | Shows current use of archive shelf with weekly history                         |
       | Rights summary           | Rights information for all media created in Jupiter with unknown copyright ... |
       | Summary Archive+Shelf    | Shows summary of Archive and Editorial Shelf                                   |
       | Shelf Use by Outlet      | Shows current use of shelf by Outlet                                           |
