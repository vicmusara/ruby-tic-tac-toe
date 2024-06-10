# Ruby Tic Tac Toe

## Plan the Structure
### Class Design:

### Game:
Manages the game flow, including player turns and win condition checks.
### oard: 
Represents the game board and handles display and updates.
### Player: 
Represents a player with a symbol (X or O).

## Instance Variables: 
•`@board (in Game)`: An instance of Board.

•`@players (in Game)`: An array of two Player instances.

•`@current_player (in Game)`: The player whose turn it is.

## Methods:

### Game:
`initialize`: Sets up the game.
`play`: Main game loop.
`switch_player`: Switches the turn between players.
`check_winner`: Checks for a win condition.
### Board:
`initialize`: Sets up the board.
`display`: Displays the current state of the board.
`update`: Updates the board with a player’s move.
`valid_move`?: Checks if a move is valid.
`full?`: Checks if the board is full.
`Player`:
`initialize`: Sets up the player with a symbol.
## Player:
`initialize`: Sets up the player with a symbol.