Feature: Get single game

  Background:
    * url 'https://balldontlie.io/'
    * path 'api/v1/games/'

  Scenario: Get game 32881
    And  path , 32881
    When method get
    Then status 200
    And match $ == read( '../json/Games/32881.json')
    And match $.postseason == false
    And match $.status == 'Final'

  Scenario:Ñ