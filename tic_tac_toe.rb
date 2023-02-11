require 'pry-byebug'

module game_winning_scenarios
  def diagonal_win?(board)
    if (board[0][0] == "X" && board[1][1] == "X" && board[2][2] == "X") ||
      (board[0][2] == "X" && board[1][1] == "X" && board[2][0] == "X"))
      return "X"
    elsif ((board[0][0] == "O" && board[1][1] == "O" && board[2][2] == "O") ||
      (board[0][2] == "O" && board[1][1] == "O" && board[2][0] == "O"))
      return "O"
    end
  end

  def row_win?(board)
    board.each_index do |rows|
      if (board[rows].all?("X"))
        return "X"
      elsif (board[rows].all?("O"))
        return "Y"
      end
    end
  end

  def column_win?(board)
    if (board[0][0] == board[0][1] == board[0][2]) return board[0][0]
    elsif (board[1][0] == board[1][1] == board[1][2]) return board[1][0]
    elsif (board[2][0] == board[2][1] == board[2][2]) return board[2][0]
    end
  end

class Board
  def initialize
    @spaces = Array.new(3) { Array.new(3, " ") }
  end
  
  def fill_space(symbol, x_coordinate, y_coordinate)
    if (@spaces[x_coordinate][y_coordinate] == " ")
      @spaces[x_coordinate][y_coordinate] = symbol
    else
      puts "That place has already been chosen."
    end
  end

  def print_board
    @spaces.each_index do |rows|
      @spaces[rows].each_index do |columns|
        if (columns == 2)
          print "\s\s\s#{@spaces[rows][columns].to_s}\s\s\s"
        else
          print "\s\s\s#{@spaces[rows][columns].to_s}\s\s\s|"
        end
      end
      if (rows == 2)
        puts ""
      else
        puts ""
        puts "-----------------------"
      end
    end
  end
end

class Player
  attr_reader :symbol, :x_coordinate, :y_coordinate

  def initialize(symbol)
    @symbol = symbol
  end

  def choose_space
    print "Enter Row Number (Starts at 0): "
    @x_coordinate = gets.chomp.to_i
    print "Enter Column Number (Starts at 0): "
    @y_coordinate = gets.chomp.to_i
  end
end