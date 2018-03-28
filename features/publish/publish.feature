@publish

Feature: Media Publish in Jupiter

  Background:
    Given Jupiter application launched and an online media item exists in search results pane

  Scenario Outline: Check media 'Publish selection' status
    When I load an online media item in QVL player
    And  I set the <in and out> points
    When I click on 'NEW' Button
    Then I should see <status>

    Examples: of in and out and status
      | in and out              | status                              |
      | in and out selected     | Public selection option enabled     |
      | in and out not selected | Public selection option not enabled |

  Scenario: Publish dialogue opens
    When  I select 'Publish selection' option
    Then  Publish dialogue must open
    And   The dialogue must show the following mandatory metadata fields

      | Outlet                    |
      | Status                    |
      | Category                  |
      | Clip Name                 |
      | Story                     |
      | Details                   |
      | Time                      |
      | Date                      |
      | Additional information    |
      | Description               |
      | In words:                 |
      | Out words:                |
      | Duration:                 |
      | Running Order Timing:     |
      | Captions                  |
      | Style                     |
      | In At                     |
      | Length                    |
      | Lines                     |
      | Audio Playback            |
      | Created:                  |
      | By:                       |
      | Deletion:                 |
      | Load this item on Publish |
      | Publish Button            |
      | Publish & Deliver Button  |
      | Cancel                    |

  Scenario: Publish a new media item with Category - Sequence
    When  Publish dialogue open for a selected media item
    And   I enter the below details in the publish dialogue

      | Outlet | Status    | Category | Story | Details      |
      | BBC3   | Rough Cut | Sequence | qa    | test-publish |

    And  I select publish button
    Then I should see the newly published media item in media search
    And  I should see the metadata for this media item as entered
    And  I should see published item added to cliplist with RO time 0'00"

  Scenario Outline: Check for editorial duration
    When I publish a media item for <status_options> and <category_options>
    And  I see the 'Running order timing' same as 'Duration'
    And  I select Publish button
    Then I should see the newly published media item in clip list
    And  I should see the 'RO time' as 'Duration' in clip list

    Examples: of status_options and category_options
      | status_options  | Category Options                                                    |
      | Raw             | <Actuality>,<Presentation>,<Graphics>,<Package>,<ROT>,<Programme>   |
      | Finished        | <Actuality>,<Presentation>,<Graphics>,<Package>,<ROT>,<Programme>   |

  Scenario Outline: Publish a media item and load the media in QVL Player
    When I create publish with the following metadata

      | Outlet | status | Category | Story | Details      |
      | BBC3   | Raw    | Package  | qa    | load-publish |

    And  I set <option> for load on publish
    Then I should see the <media>

    Examples:
      | option    | media                   |
      | checked   | media loaded in QVL     |
      | unchecked | media not loaded in QVL |

  Scenario Outline: Check for user defined editorial duration and audio playback
    When I create a publish with the following metadata

      | Outlet | status | Category | Story | Details   |
      | BBC3   | Raw    | Package  | qa    | editorial |

    And  I set <editorial duration> less than <duration>
    And  I set <audio playback> in the publish dialogue
    And  I publish the media item into the jupiter
    Then I see the <editorial duration> in the cliplist for 'RO time'
    And  I see the <audio playback> in 'Description - Technical' tab
    And  I see the <editorial duration> in 'Caption' as 'Run Order'

    Examples: of editorial duration and audio playback
      | editorial duration  | duration | audio playback |
      | 1'00"               |    2'00" |   Left         |
      | 2'30"               |    3'00" |   Right        |
      | 4'00"               |    4'00" |   Stereo       |
      | 6'00"               |    7'00" |   Mono         |

  Scenario Outline : Publish without mandatory fields
    When I create a new publish for a media item
    But  I do not set <field>
    And  I select Publish button
    Then I should see <warning> alert

  Examples: of warning and field
      | field    | warning                     |
      | Category | Please choose a Category    |
      | story    | Please enter the story name |
      | Status   | Please choose a Status      |

  Scenario Outline : Warning for 'editorial time'
    When I create a new publish for a Media Item
    But  I set <editorial duration> longer than <duration>
    And  I select Publish button
    Then I should see <warning> alert

    Examples: of warning and duration
       | warning                                     |editorial duration | duration |
       | RO time must be less than item duration     | 3'00              | 2'00     |

  Scenario Outline : Warning for clip name length
    When I create a new publish for a Media Item
    And  I set the <status> and <category> for the newly published item
    And  I set the clipname more than 29 characters
    And  I select Publish button
    Then I should see <warning> alert

    Examples: of Status warning and clip length
     |status     |category  | warning                                                                                    |
     |RoughCut   |Sequence  |Clip name over length by n Characters.Do you want to perform the operation anyway? Yes/NO   |
     |Package    |Finished  |Clip name over length by n Characters                                                       |

  Scenario: Publish a media item with long clip name for RoughCut
    When  I publish a media item with long clipname
    And   I select option 'yes' from warning alert
    Then  Media item is published successfully
    And   Published media has clipname as entered


  Scenario Outline : Check for Cancelling a publish a media item
    When I create a new publish for a media item
    And  I enter all the metadata in the publish dialogue
    And  I select <cancel> button
    Then I should see that publish dialogue closed
    And  I should see new media item not published into Jupiter

    Examples: of cancel
      | cancel               |
      | Cancel Button        |
      | Close  Button        |
