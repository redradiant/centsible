@allow-rescue
Feature: user manages locations
  As a user
  I want to manage locations associated with my account
  So that my items are received properly and billing address is correct
  Scenario: I want to update my shipping address
    Given I have an outdated address
    When I add a new location
    Then it should be stored with my account
    Then it should become my main shipping location
    Then it should be a valid address
    Then it should be geolocatable
    Then it should have some connection to my billing address
    Then my old address should not be deleted but marked inactive
