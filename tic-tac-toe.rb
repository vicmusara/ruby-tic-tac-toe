# frozen_string_literal: true

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
      puts row.join('|')
      puts '--+--+---'
    end
  end

  def update(position, symbol)
    row, col = position
    @grid[row][col] = symbol
  end

  def valid_move?(position)
    row, col = position
    @grid[row][col] == ' '
  end

  def full?
    @grid.flatten.none?  { |cell| cell == ' ' }
  end

  def winner?
    winning_combination.any? do |combo|
      [@grid[combo[0][0]][combo[0][1]], @grid[combo[1][0]][combo[1][1]],
       @grid[combo[2][0]][combo[2][1]]].uniq.length == 1 &&
        @grid[combo[0][0]][combo[0][1]] != ' '
    end
  end

  private

  def winning_combinations
    rows = [[0, 0], [0, 1], [0, 2]], [[1, 0], [1, 1], [1, 2]], [[2, 0], [2, 1], [2, 2]]
    cols = [[0, 0], [1, 0], [2, 0]], [[0, 1], [1, 1], [2, 1]], [[0, 2], [1, 2], [2, 2]]
    diags = [[0, 0], [1, 1], [2, 2]], [[0, 2], [1, 1], [2, 0]]
    rows + cols + diags
  end
end

class Game
  def initialize
    @board = Board.new
    @players = [Player.new('X'), Player.new('O')]
    @current_player = @players[0]
  end

  def play
    loop do
      @board.display
      puts "Player #{@current_player.symbol}, enter your move (row and column): "
      move = gets.chomp.split.map(&:to_i)

      if @board.valid_move?(move)
        @board.update(move, @current_player.symbol)
        if @board.winner?
          @board.display
          puts "Player #{@current_player.symbol} wins!"
          break
        elsif @board.full?
          @board.display
          puts "It's a draw!"
          break
        else
          switch_player
        end
      else
        puts 'Invalid move! Try again.'
      end
    end
  end

  private

  def switch_player
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end
end

game = Game.new
game.play
