Feature: Get list all players

  """
  This is my first time using java with Karate
  """
  """
    Variables for all test
  """
  Background:
    * url 'https://balldontlie.io/'
    * path 'api/v1/players'

  Scenario: Get list of players
    When method get
    Then status 200
    And match $ == read( '../json/All_Players/get_list_of_players_default.json')

  Scenario: Get list of players asking 0 per page
    And param per_page = 0
    When method get
    Then status 500

  Scenario: Get list of players asking 1 per page
    And param per_page = 1
    When method get
    Then status 200
    And match $ == read('../json/All_Players/get_single_player_per_page.json')

  Scenario: Get list of players asking 100 per page
    And param per_page = 100
    When method get
    Then status 200
    And match $ == read('../json/All_Players/get_100_players_per_page.json')

  Scenario: Get list of players asking 101 per page
    And param per_page = 101
    When method get
    Then status 200
    And match $ == read('../json/All_Players/get_100_players_per_page.json')

  Scenario: Get list of players asking page 0
    And param page = 0
    When method get
    Then status 200
    And match $ == read('../json/All_Players/get_list_of_players_default.json')

  Scenario: Get list of players asking page 2
    And param page = 2
    When method get
    Then status 200
    And match $ == read('../json/All_Players/get_25_players_second_page.json')

  Scenario: Get list of players asking page 3 and 10 player
    And param page = 3
    And param per_page = 10
    When method get
    Then status 200
    And match $ == read('../json/All_Players/get_10_players_page_3.json')

  Scenario: Get list of players asking page a and 10 player
    And param page = 'a'
    And param per_page = 10
    When method get
    Then status 200
    And match $ == read('../json/All_Players/get_10_players_page_a.json')

  Scenario: Get list of players asking page 3 and a player
    And param page = 3
    And param per_page = 'a'
    When method get
    Then status 500

  Scenario: Get list of players asking page a and b player
    And param page = 'a'
    And param per_page = 'b'
    When method get
    Then status 500

  Scenario: Get list of players asking page 3 and 10 player
    And param page = 3
    And param per_page = 10
    And param search = 'dav'
    When method get
    Then status 200
    And match $ == read('../json/All_Players/get_10_players_page_3_search_dav.json')

  Scenario: Get list of players asking like %l%
    And param search = '%l%'
    When method get
    Then status 200
    And match $ == read('../json/All_Players/get_like_l.json')
