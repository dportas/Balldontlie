Feature: Get single player

  Background:
    * url 'https://balldontlie.io/'
    * path 'api/v1/players/'

  Scenario: Get  player 237
    And  path , 237
    When method get
    Then status 200
    And match $ == read( '../json/Player/237.json')

  Scenario: Get  player 0
    And  path , 0
    When method get
    Then status 404

  Scenario: Get  player 3093
    And  path , 3093
    When method get
    Then status 404

  Scenario: Get  player 3092
    And  path , 3092
    When method get
    Then status 200
    And match $ == read( '../json/Player/3092.json')