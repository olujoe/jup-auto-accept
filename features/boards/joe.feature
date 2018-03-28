Feature: JOE Boards
  Background:
    Given Multiple clips have been restored previous to today
    When I restore an item

  Scenario: 'Restores Report' displays restored clips
    When I navigate to 'JOE Restores Report' board
    Then I see my restored clip with the following in results table
      | USERNAME            |
      | CREATOR             |
      | ITEMID              |
      | CLIPNAME            |
      | STATUS              |
      | OUTLET              |
      | CATEGORY            |
      | ITEM_CREATEDDATE    |
      | EARLIEST_RESTORE    |
      | MOST_RECENT_RESTORE |

  Scenario Outline: Text Search
    And I navigate to <board>
    Then I should see a search field
    When I enter the <attribute> of my clip
    Then page should display my restored clip only

    Examples: Of attribute
      | attribute | board                   |
      | clipname  |  JOE Restores Report    |
      | itemid    |  JOE Restores Report    |
      | clipname  |  JOE Performance Report |
      | itemid    |  JOE Performance Report |

  Scenario Outline: Row count selection
    And I navigate to <board>
    Then I should see a row count drop down
    When I select <rows>
    Then page should display <rows> row(s) in table only

    Examples: Of rows and board
      | rows  | board                  |
      | 1     | JOE Restores Report    |
      | 10    | JOE Restores Report    |
      | 25    | JOE Restores Report    |
      | 50    | JOE Restores Report    |
      | 100   | JOE Restores Report    |
      | 1     | JOE Performance Report |
      | 10    | JOE Performance Report |
      | 25    | JOE Performance Report |
      | 50    | JOE Performance Report |
      | 100   | JOE Performance Report |

  Scenario Outline:  Date filter
    And I navigate to <board>
    Then I should see 'From' and 'To' date fields
    When I enter a 'From' date of <from>
    And I enter a 'To' date of <to>
    Then page should display clips that were restored between selected dates only

    Examples: Of from, to and board
      | from        | to          | board                  |
      | yesterday   | today       | JOE Restores Report    |
      | 7 days ago  | today       | JOE Restores Report    |
      | 14 days ago | 7 days ago  | JOE Restores Report    |
      | yesterday   | today       | JOE Performance Report |
      | 7 days ago  | today       | JOE Performance Report |
      | 14 days ago | 7 days ago  | JOE Performance Report |

  Scenario Outline:  JOE Restores & Performance Reports - Mixed filters
    When I navigate to <board> board
    And I select <time> and <rows> filters
    Then a max of <rows> rows display clip items restored within <time>

    Examples: Of time and rows
      | time          | rows  | board                   |
      | last 6 hours  | 10    | JOE Restores Report     |
      | last week     | 100   | JOE Restores Report     |
      | last 6 hours  | 10    | JOE Performance Report  |
      | last week     | 100   | JOE Performance Report  |

  Scenario Outline: CSV download
    And I navigate to <board>
    Then I should see 'Download CSV' button
    When I click 'Download CSV' button
    Then report should download in CSV format
    And downloaded filename should contain todays date
    And downloaded file matches results table

    Examples: Of board
      | board                   |
      | JOE Restores Report     |
      | JOE Performance Report  |

  Scenario: 'Performance Report' displays specifics for restored items
    When I navigate to 'JOE Performance Report' board
    Then I should see my restored clip with the following in results table
      | JOBID            |
      | MEDIAITEMID      |
      | USERNAME         |
      | CLIPNAME         |
      | JOBSUBMITTEDTIME |
      | JOBCOMPLETEDTIME |
    And my restored clip displays the following values in results table
      | FINISHED  | FAILED |  CANCELLED |
      | true      | false  | false      |

  Scenario: 'JOE Monitoring Page' board
    When I navigate to 'JOE Monitoring Page'
    Then I should see my restored item with the following
      | Status    | Clipname              | Time                    | Username  |
      | Completed | Name of restored clip | time of restore action  | Jup User  |

  Scenario Outline: 'JOE Monitoring Page' - time filter
    And I navigate to 'JOE Monitoring Page'
    Then I should see a time filter
    When I select a time of <time>
    Then Only clips restored within <time> are displayed

    Examples: Of time
      | time          |
      | last 6 hours  |
      | last 24 hours |
      | last 48 hours |
      | last week     |

  Scenario Outline: 'JOE Monitoring Page' - Status filter
    And I navigate to 'JOE Monitoring Page'
    Then I should see a status filter
    When I select a status of <status>
    Then Only clips restored with a status of <status> are displayed

    Examples: Of status
      | status      |
      | In Progress |
      | Completed   |
      | Cancelled   |
      | Failed      |

  @manual
  Scenario Outline: 'JOE Monitoring Page' - Agent filter
    And Media Pipeline, JLibrary Save, JLibrary Restore, JLibrary Delete, JLibrary Migration and OMP transfers have been actioned
    And I navigate to 'JOE Monitoring Page'
    When I select <agent> agent filter
    Then Only clips restored with a status of <status> are displayed

    Examples: Of agent
      | status              |
      | Media Pipeline      |
      | JLibrary Save       |
      | JLibrary Restore    |
      | JLibrary Delete     |
      | JLibrary Migration  |
      | OMP JFE/JEX         |

  Scenario Outline: 'JOE Monitoring Page' - Mixed filters
    Given I navigate to 'JOE Monitoring Page'
    And I select <time>, <status> and <agent> filters
    Then only clips restored within <time>, with a status of <status> via <agent> are displayed

    Examples: Of time, status and agent
      | time          | status    | agent         |
      | last 6 hours  | completed | JLibrary Save |
      | last week     | failed    | OMP JFE/JEX   |
