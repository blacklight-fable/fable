Feature: Name facet
  In order to identify which materials are most relevant
  As a researcher
  I want to filter my search results by a "Name" facet.

  Scenario: Pre limit search by a name facet
    Given I am on the default search page
    When I limit my search to "Blakemore, Edith Rose, 1872-1947" under the "Name" category
    Then I should see search results

  Scenario: Filter search results by a name facet
    Given I am on the default search page
    When I search on the phrase "bill"
    And I limit my search to "Blakemore, Edith Rose, 1872-1947" under the "Name" category
    Then I should see search results
