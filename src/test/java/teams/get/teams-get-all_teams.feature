Feature: Get list all teams

  """
  This is my first time using java with Karate
  """
  """
    Variables for all test
  """
  Background:
    * url 'https://balldontlie.io/'
    * path 'api/v1/teams'

  Scenario: Get list of teams
    When method get
    Then status 200
    And match $ == read( '../json/All_Teams/get_list_of_teams_default.json')

  Scenario: Get list of teams asking 0 per page
    And param per_page = 0
    When method get
    Then status 500

  Scenario: Get list of teams asking 1 per page
    And param per_page = 1
    When method get
    Then status 200
    And match $ == read('../json/All_Teams/get_single_teams_per_page.json')

  Scenario: Get list of teams asking 30 per page
    And param per_page = 30
    When method get
    Then status 200
    And match $ == read('../json/All_Teams/get_list_of_teams_default.json')

  Scenario: Get list of teams asking 100 per page
    And param per_page = 100
    When method get
    Then status 200
    And match $ == read('../json/All_Teams/get_100_teams_page.json')

  Scenario: Get list of teams asking page 0
    And param page = 0
    When method get
    Then status 200
    And match $ == read('../json/All_Teams/get_list_of_teams_default.json')

  Scenario: Get list of teams asking page 2
    And param page = 2
    When method get
    Then status 200
    And match $ == read('../json/All_Teams/get_30_teams_page_2.json')

  Scenario: Get list of teams asking page 3 and 10 player
    And param page = 3
    And param per_page = 10
    When method get
    Then status 200
    And match $ == read('../json/All_Teams/get_10_teams_page_3.json')

  Scenario: Get list of teams asking page a and 10 player
    And param page = 'a'
    And param per_page = 10
    When method get
    Then status 200
    And match $ == read('../json/All_Teams/get_10_teams_page_a.json')

  Scenario: Get list of teams asking page 3 and a player
    And param page = 3
    And param per_page = 'a'
    When method get
    Then status 200
    And match $ == read('../json/All_Teams/get_a_teams_page_3.json')

  Scenario: Get list of teams asking page a and b player
    And param page = 'a'
    And param per_page = 'b'
    When method get
    Then status 200
    And match $ == read('../json/All_Teams/get_list_of_teams_default.json')

