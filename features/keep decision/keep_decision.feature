@keep_decision

  Feature: Keep Decisions

    Scenario: Media Item not deleted if component has keep decision
      Given I set a keep decision date for a component
      When The media lifecycle deletion has elapsed
      But Keep decision date has not elapsed
      Then Media Item should not be deleted