@components

Feature: Validating component creation

  Background:
    Given I set an IN point for a clip
    And I select new component option

  Scenario: Components cannot be created with just an IN point
    When I click outside of the current keyframe
    Then OUT point is created with a time of 00:00:00:00
    And OUT point is created with no thumbnail
    When I attempt to load another clip item
    Then 'KeyFrames' OUT point missing alert is displayed indicating component will NOT be created

  Scenario: Component cannot be created with missing OUT point
    When 'KeyFrames' OUT point missing alert is displayed
    And I select YES button
    Then New component is not created

  Scenario: Component can be created after missing OUT point alert prompt
    When 'KeyFrames' OUT point missing alert is displayed
    And I select NO button
    Then Alert closes
    When I set an OUT point for incomplete component
    And I save component
    Then New component is created

  Scenario: Component cannot be created with invalid IN points
    When I set an IN point for an earlier segment than the previous IN point
    And I save component
    Then OUT point is created with a time of 00:00:00:00
    When I attempt to load another clip item
    Then 'KeyFrames' OUT point missing alert is displayed
    And Component is NOT created
