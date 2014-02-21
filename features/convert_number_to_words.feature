Feature: Convert number to words

  Write some code that will accept an amount and convert it to the appropriate string representation.
    Example: Convert 2523.04 to "Two thousand five hundred twenty-three and 04/100 dollars"

  Scenario Outline: I need help writing amounts on my checks
    When I run `convert <Amount>`
    Then the output should contain exactly "<String Representation>"

    Examples:
      | Amount  | String Representation                                     |
      | 2523.04 | Two thousand five hundred twenty-three and 04/100 dollars |

