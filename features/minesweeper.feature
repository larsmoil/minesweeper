Feature: Minesweeper game

  Given a board with mines
  each cell should have number of adjacent mines or blank if zero

  Scenario: A board with a few mines
    Given a board with a 4 by 4
    And the mines are placed as following:
    | col1 | col2 | col3 | col4 |
    |      |  x   |  x   |      |
    |      |      |      |  x   |
    |      |      |      |  x   |
    |      |      |      |      |
    When I show the board
    Then I should see:
    | col1 | col2 | col3 | col4 |
    |   1  |  x   |  x   |  2   |
    |   1  |  2   |  4   |  x   |
    |      |      |  2   |  x   |
    |      |      |  1   |  1   |

