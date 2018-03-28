@publish, @publish-captions

Background:

  Given Jupiter application launched and online media item exists in search results pane

  Scenario: Check the Caption dialogue
    When I create a publish with the following metadata

      | Outlet | status | Category | Story | Details |
      | BBC3   | Raw    | Package  | qa    | caption |

    And  I click on the 'Caption'
    Then I should see New caption dialogue displays as below

       | Style         |
       | Automatic     |
       | Manual        |
       | In At         |
       | Length        |
       | Caption lines |
       | OK            |
       | Cancel        |

  Scenario: Verify the caption details in Publish Dialogue
    When I see the caption window opens
    And  I enter the caption details as below and click on OK

      | Style | Automatic | Manual | In At | Length | Caption Lines |
      | 2     | true      |        | 2'00  | 3'00   | test-caption  |

    Then I should see the caption details updated in publish dialogue as below
      | Style | Automatic | Manual | In At | Length | Caption Lines |
      | 2     | true      |        | 2'00  | 3'00   | test-caption  |

  Scenario: Verify the published caption in Jupiter
    When I publish a media item with captions
    And  I load the media in QVL
    And  I select 'Captions' tab
    Then I should see the caption details as entered in publish

  Scenario: Publish an imported JPEG and non jupiter items
    When I select an jpeg
    And  I select non jupiter items
    Then I should be able to publish the media successfully
