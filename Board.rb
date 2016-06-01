class Board
  attr_accessor :cells
  attr_reader :snakes, :ladders

  # creating static board
  def initialize
    @cells = Array.new(100)
    snakes = [ Cell.new(17, 7), Cell.new(54,34), Cell.new(62, 19), Cell.new(64, 60), Cell.new(87, 24), Cell.new(93, 73), Cell.new(96, 75), Cell.new(99, 78) ]
    ladders = [ Cell.new(4, 14), Cell.new(9, 31), Cell.new(20, 38), Cell.new(28, 84), Cell.new(40, 59), Cell.new(51, 67), Cell.new(63, 81), Cell.new(71, 91) ]
    # first initialize the cells
    (0...100).each do |i|
      @cells[i] = Cell.new(i+1, i+1)
    end

    # now add the snakes & ladders
    for cell in snakes
      x, y = cell.get_ids
      @cells[x-1] = Cell.new(x, y)
    end

    for cell in ladders
      x, y = cell.get_ids
      @cells[x-1] = Cell.new(x,y)
    end
  end

  def check_snake_or_ladder (cell_id)
    x, y = @cells[cell_id-1].get_ids
    return y
  end
end
