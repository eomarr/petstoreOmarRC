Feature: Demo de pruebas en la pagina PetStore

  Scenario Outline: Crear usuario en PetStore
    Given url 'https://petstore.swagger.io/v2/user'
    And request {"id": "<id>","username": "<username>","firstName": "<firstName>","lastName": "<lastName>","email": "<email>","password": "<password>","phone": "<phone>","userStatus": "<userStatus>"}
    When method post
    Then status 200
    Examples:
      |id|username|firstName|lastName|email|password|phone|userStatus|
      |999|Drako|Omar|Rodriguez|omarrodriguez@gmail.com|peru123|01962955000|0|

  Scenario Outline: Consultar la creacion del usuario
    Given url 'https://petstore.swagger.io/v2/user/<username>'
    When method get
    Then status 200
    And match $ == {"id": 999,"username": "Drako","firstName": "Omar","lastName": "Rodriguez","email": "omarrodriguez@gmail.com","password": "peru123","phone": "01962955000","userStatus": 0}
    Examples:
      |username|
      |Drako|

  Scenario Outline: Actualizar nombre y correo del usuario
    Given url 'https://petstore.swagger.io/v2/user/Drako'
    And request {"id": 999,"username": "<username>","firstName": "<firsName>","lastName": "Rodriguez","email": "<email>","password": "peru123","phone": "01962955000","userStatus": 0}
    When method put
    Then status 200
    Examples:
      |username|firsName  |email           |
      |Firulais|Edwin     |omar11@gmail.com|

  Scenario Outline: Buscar el nombre actualizado
    Given url 'https://petstore.swagger.io/v2/user/<username>'
    When method get
    Then status 200
    And match $ == {"id": 999,"username": "Firulais","firstName": "Edwin","lastName": "Rodriguez","email": "omar11@gmail.com","password": "peru123","phone": "01962955000","userStatus": 0}
    Examples:
      |username|
      |Firulais|

  Scenario Outline: Eliminar Usuario
    Given url 'https://petstore.swagger.io/v2/user/<username>'
    When method delete
    Then status 200
    Examples:
      |username|
      |Firulais|