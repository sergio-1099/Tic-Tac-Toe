require 'pry-byebug'

class Board
  def initialize
    @spaces = Array.new(3) { Array.new(3, " ") }
  end
  
  def fill_space(symbol, x_coordinate, y_coordinate)
    if (@spaces[x_coordinate][y_coordinate] == " ")
      @spaces[x_coordinate][y_coordinate] = symbol
    else
      puts "That place has already been chosen. Choose again..."
      return false
    end
  end

  def game_winner?
    # Row check
    @spaces.each_index do |rows|
      if (@spaces[rows].all?("X"))
        return "X"
      elsif (@spaces[rows].all?("O"))
        return "O"
      end
    end

    # Column check
    @spaces.each_index do |column|
      if ((@spaces[0][column] == @spaces[1][column] && @spaces[1][column] == @spaces[2][column]) && @spaces[0][column] == "X")
        return "X"
      elsif ((@spaces[0][column] == @spaces[1][column] && @spaces[1][column] == @spaces[2][column]) && @spaces[0][column] == "O")
        return "O"
      end
    end

    # Diagonal Check
    if ((@spaces[0][0] == @spaces[1][1] && @spaces[1][1] == @spaces[2][2]) && @spaces[0][0] == "X")
      return "X"
    elsif ((@spaces[0][2] == @spaces[1][1] && @spaces[1][1] == @spaces[2][0]) && @spaces[0][2] == "X")
      return "X"
    elsif ((@spaces[0][0] == @spaces[1][1] && @spaces[1][1] == @spaces[2][2]) && @spaces[0][0] == "O")
      return "O"
    elsif ((@spaces[0][2] == @spaces[1][1] && @spaces[1][1] == @spaces[2][0]) && @spaces[0][2] == "O")
      return "O"
    end

    return false
  end

  def tie_game?
    tie_game = false
    @spaces.each_index do |rows|
      if (@spaces[rows].all? {|element| element == "X" || element == "O" })
        tie_game = true
      else
        tie_game = false
        return tie_game
      end
    end

    return tie_game
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
    @x_coordinate = -1
    @y_coordinate = -1
    while (@x_coordinate < 0 || x_coordinate > 2)
      print "Enter Row Number (Starts at 1): "
      @x_coordinate = gets.chomp.to_i - 1
    end
    while (@y_coordinate < 0 || y_coordinate > 2)
      print "Enter Column Number (Starts at 1): "
      @y_coordinate = gets.chomp.to_i - 1
    end
  end
end

def playGame
  playerX = Player.new("X")
  playerO = Player.new("O")
  board = Board.new
  winner = board.game_winner?

  while (winner == false)
    playerX.choose_space
    while (board.fill_space(playerX.symbol, playerX.x_coordinate, playerX.y_coordinate) == false)
      playerX.choose_space
    end
    board.print_board

    winner = board.game_winner?
    if (winner)
      break
    end

    if (board.tie_game?) 
      puts "You tied!"
      return
    end

    playerO.choose_space
    while (board.fill_space(playerO.symbol, playerO.x_coordinate, playerO.y_coordinate) == false)
      playerO.choose_space
    end
    board.print_board

    winner = board.game_winner?
    if (winner)
      break
    end

    if (board.tie_game?) 
      puts "You tied!"
      return
    end
  end

  return "Player #{winner} won!"
end


puts playGame