require 'pry-byebug'

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