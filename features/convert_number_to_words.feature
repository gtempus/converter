Feature: Convert number to words

  Write some code that will accept an amount and convert it to the appropriate string representation.
    Example: Convert 2523.04 to "Two thousand five hundred twenty-three and 04/100 dollars"

  Scenario Outline: I write really small checks
    When I run `convert <Amount>`
    Then the output should contain exactly "<String Representation>"

    Examples:
      | Amount | String Representation   |
      |    .00 | Zero and 00/100 dollars |
      |    .01 | Zero and 01/100 dollars |
      |   0    | Zero and 00/100 dollars |
      |   0.00 | Zero and 00/100 dollars |
      |   0.01 | Zero and 01/100 dollars |


  Scenario Outline: I write checks no bigger than $20
    When I run `convert <Amount>`
    Then the output should contain exactly "<String Representation>"

    Examples:
      | Amount | String Representation     |
      |   1    | One and 00/100 dollars    |
      |   1.10 | One and 10/100 dollars    |
      |  11.00 | Eleven and 00/100 dollars |
      |  20.00 | Twenty and 00/100 dollars |      


  Scenario Outline: I write checks between $21 and $99 inclusive
    When I run `convert <Amount>`
    Then the output should contain exactly "<String Representation>"

    Examples:
      | Amount | String Representation         |
      |  21.00 | Twenty-one and 00/100 dollars |

      
  Scenario Outline: I write checks between $100 and $999 inclusive
    When I run `convert <Amount>`
    Then the output should contain exactly "<String Representation>"

    Examples:
      | Amount | String Representation                      |
      | 100.00 | One hundred and 00/100 dollars             |
      | 742.23 | Seven hundred forty-two and 23/100 dollars |


  Scenario Outline: I'm a big spender!
    When I run `convert <Amount>`
    Then the output should contain exactly "<String Representation>"

    Examples:
      | Amount    | String Representation                                                         |
      |   1000.00 | One thousand and 00/100 dollars                                               |
      | 100000.00 | One hundred thousand and 00/100 dollars                                       |
      |  65289.99 | Sixty-five thousand two hundred eighty-nine and 99/100 dollars                |
      | 387456.42 | Three hundred eighty-seven thousand four hundred fifty-six and 42/100 dollars | 


  Scenario Outline: I'm a millionare
    When I run `convert <Amount>`
    Then the output should contain exactly "<String Representation>"

    Examples:
      | Amount       | String Representation                                                                                |
      |   1000000.00 | One million and 00/100 dollars                                                                       |
      | 100000000.00 | One hundred million and 00/100 dollars                                                               |      
      | 529360580.25 | Five hundred twenty-nine million three hundred sixty thousand five hundred eighty and 25/100 dollars |


  Scenario Outline: I can buy small countries
    When I run `convert <Amount>`
    Then the output should contain exactly "<String Representation>"

    Examples:
      | Amount        | String Representation          |    
      | 1000000000.00 | One billion and 00/100 dollars |
