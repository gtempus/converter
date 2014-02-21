Feature: Convert number to words

  Write some code that will accept an amount and convert it to the appropriate string representation.
    Example: Convert 2523.04 to "Two thousand five hundred twenty-three and 04/100 dollars"

  Scenario Outline: I need help writing amounts on my checks
    When I run `convert <Amount>`
    Then the output should contain exactly "<String Representation>"

    Examples:
      | Amount | String Representation     |
      |    .00 | Zero and 00/100 dollars   |
      |    .01 | Zero and 01/100 dollars   |
      |   0    | Zero and 00/100 dollars   |
      |   0.00 | Zero and 00/100 dollars   |
      |   0.01 | Zero and 01/100 dollars   |
      |   1    | One and 00/100 dollars    |
      |   1.10 | One and 10/100 dollars    |
      |  11.00 | Eleven and 00/100 dollars |
      |  20.00 | Twenty and 00/100 dollars |      


