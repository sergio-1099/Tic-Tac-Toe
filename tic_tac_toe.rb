require 'pry-byebug'

class Board
  def initialize
    @spaces = Array.new(3) { Array.new(3, " ") }
  end
  
  def fill_space(symbol, x_coordinate, y_coordinate)
    @spaces[x_coordinate][y_coordinate] = symbol
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
  def initialize(symbol)
    @symbol = symbol
  end
end
