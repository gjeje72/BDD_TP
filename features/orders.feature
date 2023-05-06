Feature: Orders management
  Scenario: List orders
    When I list all "orders"
    Then I should have response "OK"
     And following "orders" list:
       | id | orderDate | recipeId | quantity | userId |
       | df161443-770d-4d28-b7c2-35392021b932 | 2023-04-23 | a35ce12d-d52b-4a07-90ad-68e985b779e7 | 5 | 6c84fb90-12c4-11e1-840d-7b25c5ee775a |
       | an161443-770d-4d28-b7c2-35392021b932 | 2023-02-12 | a35ce12d-d52b-4a07-90ad-68e985b779e7 | 1 | 6c84fb90-12c4-11e1-840d-7b25c5ee775a |

  Scenario: Get an order
    When I get the "order" having id "df161443-770d-4d28-b7c2-35392021b932"
    Then I should have response "OK"
    And following "order" item:
      | id | orderDate | recipeId | quantity | userId |
      | df161443-770d-4d28-b7c2-35392021b932 | 2023-04-23 | a35ce12d-d52b-4a07-90ad-68e985b779e7 | 5 | 6c84fb90-12c4-11e1-840d-7b25c5ee775a |

  Scenario: Get an inexistant order
    When I get the "order" having id "f2514f8b-2c0e-47d5-bfe6-34ef89bab6dc"
    Then I should have response "NOT_FOUND"
     And following error : "Order with id f2514f8b-2c0e-47d5-bfe6-34ef89bab6dc not found"

  Scenario: Create an order
    When I create the following "order":
      | orderDate | recipeId | quantity | userId |
      | 2023-04-27 | dc466424-4297-481a-a8de-aa0898852da1 | 2 | 6c84fb90-12c4-11e1-840d-7b25c5ee775a |
    Then I should have response "CREATED"
     And following new "order" item:
      | orderDate | recipeId | quantity | userId |
      | 2023-04-27 | dc466424-4297-481a-a8de-aa0898852da1 | 2 | 6c84fb90-12c4-11e1-840d-7b25c5ee775a |

  Scenario: Update an order
    When I update the "order" having id "df161443-770d-4d28-b7c2-35392021b932" with following data:
      | id | orderDate | recipeId | quantity | userId |
      | df161443-770d-4d28-b7c2-35392021b932 | 2023-04-23 | a35ce12d-d52b-4a07-90ad-68e985b779e7 | 4 | 6c84fb90-12c4-11e1-840d-7b25c5ee775a |
    Then I should have response "OK"
     And following "order" item:
      | id | orderDate | recipeId | quantity | userId |
      | df161443-770d-4d28-b7c2-35392021b932 | 2023-04-23 | a35ce12d-d52b-4a07-90ad-68e985b779e7 | 4 | 6c84fb90-12c4-11e1-840d-7b25c5ee775a |
  
  Scenario: Update an inexistant order
    When I update the "order" having id "a35ce12d-d52b-4a07-90ad-68e985b779e7" with following data:
      | id | orderDate | recipeId | quantity | userId |
      | a35ce12d-d52b-4a07-90ad-68e985b779e7 | 2023-04-23 | a35ce12d-d52b-4a07-90ad-68e985b779e7 | 5 | 6c84fb90-12c4-11e1-840d-7b25c5ee775a |
    Then I should have response "NOT_FOUND"
    And following error : "Order with id a35ce12d-d52b-4a07-90ad-68e985b779e7 not found"

  Scenario: Delete an order
    When I delete the "order" having id "an161443-770d-4d28-b7c2-35392021b932"
    Then I should have response "OK"
     And following deleted "order" item:
       | id | orderDate | recipeId | quantity | userId |
       | an161443-770d-4d28-b7c2-35392021b932 | 2023-02-12 | a35ce12d-d52b-4a07-90ad-68e985b779e7 | 1 | 6c84fb90-12c4-11e1-840d-7b25c5ee775a |
  Scenario: Delete an inexistant order
    When I delete the "order" having id "340e6ab1-31ff-421a-bf5f-f8280db3b754"
    Then I should have response "NOT_FOUND"
     And following error : "Order with id 340e6ab1-31ff-421a-bf5f-f8280db3b754 not found"
 