@component
Feature: Setting metadata for user created components

  Scenario: Component - Dopesheet
    Given I set the following dope sheet metadata for component
      | test data |
    When I reload media item
    And I inspect dopesheet for component
    Then I should see the following dopesheet metadata
      | test data |

  Scenario: Component - Rights
    Given I set the following rights for component
      | copyright | traffic light | usage restrictions  |
      | ITV sport | red           | test restrictions   |
    When I reload media item
    And I inspect rights for component
    Then I should see the following rights information
      | copyright | traffic light | usage restrictions  |
      | ITV sport | red           | test restrictions   |
    And Existing rights table should display the following
      | In                              | Out                             | Copyright | TL  | Restrictions      |
      | correct in point for component  | correct OUT point for component | ITV sport | R   | test restrictions |
    And component timeline colour should change to red

  Scenario: Component - Archive
    Given I set the following archive information for a component
      | Keyword(s) | Editorial | Shot On  | Person/Position | Lanuguage ID |
      | keyword    | editorial | shots    | test/tester     | English      |
    When I reload media item
    And I inspect archive for component
    Then I should see the following archive information
      | Keyword(s) | Editorial | Shot On  | Person/Position | Lanuguage ID |
      | keyword    | editorial | shots    | test/tester     | English      |

  Scenario: Component - Music
    Given I set the following music information for a component
      | Music code | Background/visual code | Music Title | CD Title | Track no |  Composer | Publisher | Arranger | Performer | Label | Prefix/Suffix |
      | video      | background music       | test        | test     | 10       |  test     | test      | test     | test      | test  | test          |
    When I reload media item
    And I inspect music for component
    Then I should see the following music information
      | Music code | Background/visual code | Music Title | CD Title | Track no |  Composer | Publisher | Arranger | Performer | Label | Prefix/Suffix |
      | video      | background music       | test        | test     | 10       |  test     | test      | test     | test      | test  | test          |

  Scenario: Component - Technical
    Given I set the following technical information for a component
      | Format  | Sound | Quality | Crew      |
      | 16x9    | mono  | normal  | test crew |
    When I reload media item
    And I inspect technical metadata for component
    Then I should see the following music information
      | Format  | Sound | Quality | Crew      |
      | 16x9    | mono  | normal  | test crew |

  Scenario: Component - Keep decision
    Given I set a keep decision date for a component
    When I reload media item
    And I inspect keep decision for component
    Then I should see the keep decision date

  Scenario: Quick component - Dopesheet
    Given I create a 'Quick Component' dopesheet with the following
      | test data |
    When I reload media item
    And I inspect dopesheet for component
    Then I should see the following dopesheet metadata
      | test data |

  Scenario: Quick Component - Rights
    Given I create 'Quick Component' rights with the following
      | copyright | traffic light | usage restrictions  |
      | ITV sport | red           | test restrictions   |
    When I reload media item
    And I inspect rights for component
    Then I should see the following rights information
      | copyright | traffic light | usage restrictions  |
      | ITV sport | red           | test restrictions   |
    And Existing rights table should display the following
      | In                              | Out                             | Copyright | TL  | Restrictions      |
      | correct in point for component  | correct OUT point for component | ITV sport | R   | test restrictions |
    And component timeline colour should change to red

  Scenario: Quick Component - Archive
    Given I create a 'Quick Component' archive with the following
      | Keyword(s) | Editorial | Shot On  | Person/Position | Lanuguage ID |
      | keyword    | editorial | shots    | test/tester     | English      |
    When I reload media item
    And I inspect archive for component
    Then I should see the following archive information
      | Keyword(s) | Editorial | Shot On  | Person/Position | Lanuguage ID |
      | keyword    | editorial | shots    | test/tester     | English      |

  Scenario: Quick Component - Music
    Given I create 'Quick Component' music metadata with the following
      | Music code | Background/visual code | Music Title | CD Title | Track no |  Composer | Publisher | Arranger | Performer | Label | Prefix/Suffix |
      | video      | background music       | test        | test     | 10       |  test     | test      | test     | test      | test  | test          |
    When I reload media item
    And I inspect music for component
    Then I should see the following music information
      | Music code | Background/visual code | Music Title | CD Title | Track no |  Composer | Publisher | Arranger | Performer | Label | Prefix/Suffix |
      | video      | background music       | test        | test     | 10       |  test     | test      | test     | test      | test  | test          |

  Scenario: Quick Component - Technical
    Given I create 'Quick Component' technical metadata with the following
      | Format  | Sound | Quality | Crew      |
      | 16x9    | mono  | normal  | test crew |
    When I reload media item
    And I inspect technical metadata for component
    Then I should see the following music information
      | Format  | Sound | Quality | Crew      |
      | 16x9    | mono  | normal  | test crew |

  Scenario: Quick Component - Keep decision
    Given I create a 'Quick Component' keep decision
    When I reload media item
    And I inspect keep decision for component
    Then I should see the keep decision date

  Scenario: Metadata labels for components
    Given I have a component with dopesheet, rights, archive, music, technical and keep decision metadata
    When I inspect component
    Then I should see the following labels
      | Dopesheet |
      | Rights    |
      | Archive   |
      | Music     |
      | Technical |
      | Keep      |

  Scenario Outline: Editing existing metadata
    Given I have a component with <type> metadata
    And I modify existing <type> metadata
    When I reload media item
    And I inspect <type> metadata
    Then I should see modified changes

    Examples: Of type

      | type      |
      | dopesheet |
      | rights    |
      | archive   |
      | music     |
      | technical |
      | keep      |

  Scenario: Components cannot be inherited
    Given I create a component
    And I create a subclip which spans the length of the new component
    When I load the newly created clip
    And I inspect keyframes
    Then components should be empty

  Scenario: Component cache
    Given I create a component
    When I access local filesystem path : \users\<username>\AppData\Local\Temp\Jupiter\Keyframes
    And I change file extension of latest item from .tmp to .jpg
    And I open jpg file
    Then jpg matches newly created component thumbnail image