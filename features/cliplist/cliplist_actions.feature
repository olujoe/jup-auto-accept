@Cliplist

Feature: Cliplist

  Background:
    Given I select a cliplist item

  Scenario Outline: Media item can be loaded into QVL
    When I <action> selected cliplist item
    Then Selected media item is loaded successfully into QVL

    Examples: Of action
      | action        |
      | double click  |
      | RCA 'view'    |

  Scenario: Qcut can be launched from RCA
    When I select 'edit' RCA
    Then Qcut editor opens

  Scenario Outline: Clip details can be copied onto system clipboard
    When I select 'copy' RCA
    And I select <action>
    And I paste system clipboard
    Then correct <action> for selected clip is pasted in correct <format>

    Examples: Of copy_action

      | action    | format                                      |
      | shortcut  | <<jupiter://(0-10)[(clipname)]:(clip_id)>>  |
      | clipname  | clipname                                    |

  Scenario Outline: Archive, Playout, Print, Keep Decision, Shelf Restore, Transfer, Delivery, Departure Booking, MOS and Recommendation dialogs can be opened from cliplist
    When I select <rca>
    Then <dialog> dialog is displayed

    Examples: Of rca, dialog and view

      | rca                          | dialog                          |
      | view archive requests        | Existing Archive Requests       |
      | playout                      | Playout                         |
      | print                        | Print Options                   |
      | keep decision                | Keep Decision                   |
      | restore                      | Jupiter - Restore               |
      | transfer                     | Jupiter - Site To Site Transfer |
      | deliver                      | TX Destination                  |
      | add to new departure booking | Departure Booking               |
      | automation editor            | MOS CLIP                        |
      | recommend to keep            | Recommend To Keep               |

  Scenario: View Recommendations
    Given I select a cliplist item
    When I select 'view recommendations' RCA
    Then Recommendations tab displays listing historical recommendation info for selected clip

  Scenario: Copyright log
    When I select 'export item information' RCA
    And I select 'Copyright log'
    When I paste system clipboard
    Then the following clip metadata is pasted

      | Item Name   |
      | Description |
      | Locations   |
      | In Words    |
      | Out Words   |
      | Duration    |
      | Astons      |
      | Item Name   |

  Scenario: Archive Cataloguing
    When I select 'export item information' RCA
    And I select 'Archive cataloguing'
    Then 'Export Metadata As XML File' dialog is displayed
    When I set a filename and export location
    And I click 'Save'
    Then XML file containing <MediaItems> is created at export location

  @manual
  Scenario Outline: Qcut BBC Bin syncing
    When I select 'edit' RCA
    Then Qcut editor opens
    And BBC bin contains all my cliplist items
    When I <action> item to/from cliplist
    Then Item is added/removed to/from BBC bin

    Examples: Of action
      | action  |
      | add     |
      | remove  |

  Scenario Outline: Mail - Sending cliplist details
    When I select 'send to' RCA
    And I select <action>
    Then <mail_client> is displayed
    And clipname is present in 'subject' and 'attachments' fields

    Examples: Of action and mail_client

      | action          | mail_client         |
      | user            | Jupiter mail client |
      | mail recipient  | System mail client  |

  Scenario Outline: JEX - 'Export' and 'Export Status'
    Given I select a cliplist item
    When I select <rca>
    Then <dialog> is launched

    Examples: Of rca and dialog

      | rca           | dialog                |
      | export status | JEX export browser    |
      | export        | Jupiter export client |
