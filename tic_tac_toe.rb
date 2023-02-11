class Board
  def initialize
    @spaces = Array.new(3) { Array.new(3, nil) }
  end
  
  def fillSpace(symbol, x_coordinate, y_coordinate)
    @spaces[x_coordinate][y_coordinate] = symbol
  end
end