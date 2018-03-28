@Shelf

Feature: Editorial Shelf
  Background:

    Given Jupiter application launched and an Online media item exists in search results pane

  Scenario Outline: Keep decision option enabled
    When I select an online media item in Jupiter
    And I Right Click on Media item
    Then I should see the <option> enabled
    Examples:
        |option          |
        |keep decision   |

  Scenario: keep decision dialogue opens
    Given keep decision option enabled
    When I select the keep decision option
    Then I should see the keep decision dialogue opens
    And I should see the following mandatory fields
      | Online              |
      | Keep Online         |
      | Shelf               |
      | Keep on Shelf       |
      | Action              |
      | ArchiveChoice       |
      | Offline Archive     |
      | Archive Flag        |

  Scenario: Send an online media item
    Given
    When I select the keep decision option
    Then I should see the keep decision dialogue opens
    And I should see the following mandatory fields
      | Online              |
      | Keep Online         |
      | Shelf               |
      | Keep on Shelf       |
      | Action              |
      | ArchiveChoice       |
      | Offline Archive     |
      | Archive Flag        |

