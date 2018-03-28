@publish, @publish-deliver

Background:
Given An Online media item exists

Scenario: Publish and delivery
    When I create a new publish for a Media Item
    And  I enter below details in the publish dialogue
         | Outlet | status   | Category | Story | Details         |
         | BBC3   | Finished | Sequence | qa    | online-delivery |

    And  I click on Publish & Delivery button
    Then I should see a TX delivery window opens as below

         | Deliver | Outlet | Destination | Status | Priority | Show |
         | BBC3    | News   | Online      | Ready  | Normal   | True |

    When I start an online delivery
    Then I see the 'delivery Queue Control dialogue' with the following

         | Online                    |
         | Submitted                 |
         | Start                     |
         | End                       |
         | Clip                      |
         | Duration                  |
         | %Progress                 |
         | Priority                  |
         | User                      |
         | Destination               |
         | Close                     |

    And  I see the progress as 'Submitted'
    And  I see the delivery completed
    And  New Media item published

Scenario: Cancel a delivery and Check the Publish
    When I start publish and delivery for a Media Item
    And  I click Publish and Deliver
    Then I see the delivery is in progress in 'Delivery dialogue'
    When I click cancel
    Then I see the the delivery as cancelled
    And  I see the new published item in jupiter