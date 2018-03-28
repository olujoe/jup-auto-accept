@components

Feature: Components

  Scenario: Component edit dialogue displayed after setting IN and OUT points for new component
    Given I set IN and OUT points for a clip
    And I select new component option
    Then Component edit dialog opens displaying the following

      | thumbnail for IN point  |
      | thumbnail for OUT point |
      | story select field      |
      | title input field       |
      | best checkbox           |
      | archive checkbox        |
      | dopesheet tab           |
      | rights tab              |
      | archive tab             |
      | keep tab                |
      | technical tab           |
      | music tab               |

  Scenario Outline: Component save on user action
    Given I set IN and OUT points for a clip
    And I select new component
    When I <action>
    Then New component is created

    Examples: Of action

      | action      |
      | click away  |
      | save        |

  Scenario: Component timeline can be seen
    Given I select an existing component
    Then Timeline cursor moves to component IN point
    And A grey bar spans from IN to OUT point for selected component

  Scenario: Multiple component timelines can be seen
    Given I view keyframes for clip with multiple components
    Then Each component displays grey bar accross timeline

  Scenario: Mail send
    Given I select an existing component
    And I select rca option : 'Send to Email recipient'
    Then mail client opens
    And component details are present in both subject and attachment fields
    When mail is sent
    And recipient opens email
    Then Clip loads in QVL with timeline cursor highlighting the first frame of selected component

  Scenario: Copy component as shortcut
    Given I select an existing component
    And I select rca option : 'Copy as shortcut'
    And I paste clipboard contents
    Then Clip shortcut is pasted similar to the following

      | <<jupiter://(0-10)[(clipname)]:318421.289>> |

  Scenario Outline: Filtering components
    Given Clip has multiple components, bookmarks and keyframes created by different users
    When I inspect keyframes for clip
    And I filter by <filter>
    Then I should see <results>

    Examples: Of filter and results

      |  filter      | results                                                         |
      |  All         | all user and system created components, bookmarks and keyframes |
      |  Selected    | all user created components, bookmarks and keyframes            |
      |  Component   | all user created components                                     |
      |  My Mark Up  | only current users created components, bookmarks and keyframes  |
