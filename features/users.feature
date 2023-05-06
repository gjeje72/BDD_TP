Feature: Users management
  Scenario: List users
    When I list all "users"
    Then I should have response "OK"
     And following "users" list:
       | id | lastName | firstName | birthDate | address | phone | email |
       | 6c84fb90-12c4-11e1-840d-7b25c5ee775a | Grollier | Theo | 2001-11-04 | Rue de la chatterie - 44800 St Herblain | +33606060606 | theo.g@gmail.com |
       | 31f5df5d-1776-4c5f-af6d-ce473dce3486 | Diot | Jeremy | 1874-07-23 | Rue St Michel - 35000 Rennes | +33606060606 | jdiot@hotmail.com |

  Scenario: Get a user
    When I get the "user" having id "6c84fb90-12c4-11e1-840d-7b25c5ee775a"
    Then I should have response "OK"
     And following "user" item:
       | id | lastName | firstName | birthDate | address | phone | email |
       | 6c84fb90-12c4-11e1-840d-7b25c5ee775a | Grollier | Theo | 2001-11-04 | Rue de la chatterie - 44800 St Herblain | +33606060606 | theo.g@gmail.com |

  Scenario: Get an inexistant user
    When I get the "user" having id "f2514f8b-2c0e-47d5-bfe6-34ef89bab6dc"
    Then I should have response "NOT_FOUND"
     And following error : "User with uuid f2514f8b-2c0e-47d5-bfe6-34ef89bab6dc not found"

  Scenario: Create a user
    When I create the following "user":
       | lastName | firstName | birthDate | address | phone | email |
       | Oudea | Nicolas | 2001-12-13 | Rue de la chatterie - 44800 St Herblain | +33606060606 | noudea@gmail.com |
    Then I should have response "CREATED"
     And following new "user" item:
       | lastName | firstName | birthDate | address | phone | email |
       | Oudea | Nicolas | 2001-12-13 | Rue de la chatterie - 44800 St Herblain | +33606060606 | noudea@gmail.com |

  Scenario: Update a user
    When I update the "user" having id "6c84fb90-12c4-11e1-840d-7b25c5ee775a" with following data:
       | lastName | firstName | birthDate | address | phone | email |
       | Grollier | Theo | 2001-11-14 | Rue de la chatterie - 44800 St Herblain | +33606060606 | theo.g@gmail.com |
    Then I should have response "OK"
     And following "user" item:
       | id | lastName | firstName | birthDate | address | phone | email |
       | 6c84fb90-12c4-11e1-840d-7b25c5ee775a | Grollier | Theo | 2001-11-14 | Rue de la chatterie - 44800 St Herblain | +33606060606 | theo.g@gmail.com |

  Scenario: Update an inexistant user
    When I update the "user" having id "340e6ab1-31ff-421a-bf5f-f8280db3b754" with following data:
       | lastName | firstName | birthDate | address | phone | email |
       | Grollier | Theo | 2001-11-14 | Rue de la chatterie - 44800 St Herblain | +33606060606 | theo.g@gmail.com |
    Then I should have response "NOT_FOUND"
     And following error : "User with uuid 340e6ab1-31ff-421a-bf5f-f8280db3b754 not found"

  Scenario: Delete a user
    When I delete the "user" having id "31f5df5d-1776-4c5f-af6d-ce473dce3486"
    Then I should have response "OK"
     And following deleted "user" item:
       | id | lastName | firstName | birthDate | address | phone | email |
       | 31f5df5d-1776-4c5f-af6d-ce473dce3486 | Diot | Jeremy | 1874-07-23 | Rue St Michel - 35000 Rennes | +33606060606 | jdiot@hotmail.com |
  Scenario: Delete an inexistant user
    When I delete the "user" having id "340e6ab1-31ff-421a-bf5f-f8280db3b754"
    Then I should have response "NOT_FOUND"
     And following error : "User with uuid 340e6ab1-31ff-421a-bf5f-f8280db3b754 not found"
