@Component

Feature: Components

  Scenario Outline: Component edit mode can be accessed
    Given I am viewing existing keyframes
    When I perform <action> on a component
    Then Component switches to edit mode

    Examples: Of action

      | action              |
      | rca 'edit' option   |
      | toolbar edit button |

  Scenario Outline: Component can be deleted
    Given I am viewing existing components
    When I perform <action> on a component
    Then Component is deleted

    Examples: Of action

      | action                |
      | rca 'delete' option   |
      | toolbar delete button |

  Scenario Outline: Extending components
    Given I inspect an existing component
    When I select a new <type> point
    And I select rca option : 'Take new <type> point'
    Then existing component is extended with new <type> point
    And Timeline reflects new <type> point

    Examples: Of type

      | type  |
      | IN    |
      | OUT   |

  Scenario: Component description can be set
    Given I create a component with the following description
      | test description  |
    When I reload media item
    And I inspect component descriptions
    Then Description for component has a value of
      | test description  |
