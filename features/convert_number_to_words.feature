Feature: Convert number to words

  Write some code that will accept an amount and convert it to the appropriate string representation.
    Example: Convert 2523.04 to "Two thousand five hundred twenty-three and 04/100 dollars"

  Scenario: I need help writing amounts on my checks
    When I run `convert 2523.04`
    Then the output should contain exactly:
      """
      Two thousand five hundred twenty-three and 04/100 dollars
      """
