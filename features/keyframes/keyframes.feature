@keyframes

  Feature: Keyframes

    Scenario: Automatic keyframes are created for a crash recording
      Given I create a crash recording
      When I check keyframes
      Then I should see system created keyframes