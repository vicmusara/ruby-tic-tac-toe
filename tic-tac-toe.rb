# Class Design
# Player class
class Player
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end
end

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, ' ') }
  end

  def display
    @grid.each do |row|
      puts row.join("|")
      puts "--+--+---"
    end
  end

  def update(position, symbol)
    row, col = position
    @grid[row][col] = symbol
  end

  def valid_move?(position)
    row, col = position
    @grid[row][col] == " "
  end

  def full?
    @grid.flatten.none?  { |cell| cell == " "}
  end

  def winner?
    winning_combination.any? do |combo|
        [@grid[combo[0][0]][combo[0][1]], @grid[combo[1][0]][combo[1][1]], 
         @grid[combo[2][0]][combo[2][1]]].uniq.length == 1 &&
          @grid[combo[0][0]][combo[0][1]] != " "
    end
  end

  private

  def winning_combinations
    rows = [[0,0], [0,1], [0,2]], [[1,0], [1,1], [1,2]], [[2,0], [2,1], [2,2]]
    cols = [[0,0], [1,0], [2,0]], [[0,1], [1,1], [2,1]], [[0,2], [1,2], [2,2]]
    diags = [[0,0], [1,1], [2,2]], [[0,2], [1,1], [2,0]]
    rows + cols + diags
  end
end
