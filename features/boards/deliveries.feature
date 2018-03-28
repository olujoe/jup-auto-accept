Feature : Delivery Boards

  Scenario: Delivery monitoring
    Given high, normal and low priority items are all being delivered
    When I navigate to  all deliveries queue
    Then I see all deliveries in progress
    And each in progress delivery has the following attributes
      | Title    |
      | Duration |
      | Status   |
      | Rem      |
    And each in progress delivery has the correct indicator according to its priority
      | Item Priority | Indicator        |
      | High          | Yellow up arrow  |
      | Normal        | No arrow         |
      | Low           | Blue Down        |

  Scenario Outline: Online and Raven Deliveries
    Given I start a <delivery_type> delivery
    When I navigate to <board> delivery board
    Then delivery item is displayed with the following values
      | Q (destination) | Title               | Duration               | Status   |
      | Online          | title of media item | duration of media item | Dubbing  |
    And item is removed from delivery board once operation is complete

    Examples: of delivery_type and board
    | delivery_type | board  |
    | Online        | Online |
    | Raven         | Raven  |
