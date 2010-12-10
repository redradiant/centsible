@wip
Feature: user bids on auction
  As a user
  I want to bid on an auction in overtime
  So that I can win an item
  Scenario: I bid on an auction in overtime
    Given I am not the highest bidder
    Given the auction is in overtime
    Given I have bids available
    When I place a bid
    Then I should become the highest bidder
    Then it should have 15 bids
    Then it should have 10 more seconds remaining
    Then I should not be able to bid over myself
    Then it should allow more bidding
    Then I should win if nobody else bids
