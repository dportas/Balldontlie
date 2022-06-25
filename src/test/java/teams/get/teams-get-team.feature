Feature: Get single team

  Background:
    * url 'https://balldontlie.io/'
    * path 'api/v1/teams/'

  Scenario: Get team 1
    And  path , 1
    When method get
    Then status 200
    And match $ == read( '../json/Team/1.json')

  Scenario: Get team 0
    And  path , 0
    When method get
    Then status 404

  Scenario: Get  player 31
    And  path , 30
    When method get
    Then status 404

  Scenario: Get  player 30
    And  path , 3092
    When method get
    Then status 200
    And match $ == read( '../json/Team/30.json')