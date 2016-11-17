Feature: Average rating is displayed

Background:
  Given 1 restaurant exists

  Scenario: On list of restaurants
    When I go to the homepage
    Then I should see a div element with ID "average-rating"

  Scenario Outline: With the correct value
    And has reviews with <ratings>
    When I go to the homepage
    Then I see the average review of <average>

    Examples:
    | ratings | average |
    |   4,5   |   4.5   |
    |   1,2   |   1.5   |
    |   3,5   |    4    |

  Scenario: On restaurant page
    And has reviews with 3,4
    When I go to the restaurant page
    Then I see the average review of 3.5
