@publish, @republish,


Feature: Republish
  Background:

  Given An Online media item is present in cliplist
    And A placeholder item added to cliplist
    And A finished item added to cliplist

  Scenario: Republish dialogue
    When I open publish dialogue
    And  I click on the 'Republish existing item' tab
    Then I should see cliplist items loaded in republish dialogue
    And  I should see the published clips as enabled
    And  I should see each media item should have the following fields

    | Clip name        |
    | Duration         |
    | Status           |
    | Outlet           |
    | TL               |
    | Copyright        |
    | Description      |
    | *                |
    | ROTime           |
    | CreationDateTime |

  Scenario: Republish the media item
    When I select an online clip from the republish existing items
    And  I click on 'Republish' button
    Then I should see the Publish dialogue
    When I enter the metadata and click 'Publish'
    Then The republished clip should load in QVL
    And  I should see the metadata as entered

  Scenario: Republish over a Placeholder
    When  I start a re-publish for a media item
    And   I select the placeholder from existing items
    And   I select 'Republish' button
    Then  I should see the publish dialogue
    When  I enter the metadata and select publish button
    Then  I should see the new media item published into placeholder

  Scenario Outline: Republish over a finished item
    When  I start re-publish for a media item
    And   I select a finished item from existing items
    And   I click republish button
    Then  I should see the <warning> as below

    Examples: of warning

    | warning                                                              |
    | Only an unfinished media item can be republished into a media item   |

  Scenario: Republish over a placeholder in Departure Booking
    Given A Departure booking created with placeholder in playlist
    When  I start re-publish for a media item
    And   I select a placeholder item from cliplist
    And   I click 'Republish' button
    Then  I should see the publish window
    When  I enter the metadata and publish
    Then  The media item published into placeholder
    And   The published media into placeholder added into departure booking playlist




