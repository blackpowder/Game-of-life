class Game_of_life

  def initialize
    @board = []
    File.open("starting_board.txt", "r") do |file|
      @content = file.read
      @content.lines.each do |line|
        @board << line.strip.split(//)
      end
    end
  end

  #call next turn and save the outputs to a new file
  def start
    puts `cat starting_board.txt`
    new_board = next_turn(@board)
    300.times do
      save_board(new_board)
      puts '========='
      puts `cat new_board.txt`
      sleep(0.1)
      new_board = next_turn(new_board)
    end
  end

  def save_board(board)
    File.open("new_board.txt", "w+") do |f|    #to_do fix "w+"
      board.each do |row|
        f.write row.join + "\n"
      end
    end
  end

  #create a new board with the updated values from one turn
  def next_turn(board)
    new_board =  Array.new(board.size) {Array.new (board[0].size)}

    #iterate over each cell in the board and calculate it's value by calling next_cell_value
    board.each_with_index do |cells, row|
      cells.each_with_index do |cell, column|
        new_board[row][column] = next_cell_value(board, row, column)
      end
    end
    new_board
  end


  def next_cell_value(board, row, column)

    #Any live cell with fewer than two live neighbours dies, as if caused by under-population.
    #Any live cell with two or three live neighbours lives on to the next generation.
    #Any live cell with more than three live neighbours dies, as if by overcrowding.
    #Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

    neighbours = neighbours_of(board, row, column)
    cell_value = board[row][column]

    cell_alive = cell_value == "*"
    cell_dead = cell_value == "."

    neighbours_alive = neighbours.count("*")
    neighbours_dead = neighbours.count(".")

    if cell_alive and (neighbours_alive < 2 or neighbours_alive > 3)
      cell_value = "."
    elsif cell_dead and neighbours_alive == 3
      cell_value = "*"
    end
    cell_value

  end

  #return the neighbours of the cell at row, column
  def neighbours_of(board, row, column)

    height = board.size
    width = board[0].size

    #generate co-ordinates for all the neighbours
    coordinates = [
      [row - 1, column - 1],
      [row - 1, column],
      [row - 1, column + 1],

      [row, column -1],
      [row, column +1],

      [row + 1, column - 1],
      [row + 1, column],
      [row + 1, column + 1],
    ]

    #filter out all the coordinates which are outside of the board boundary
    coordinates_in_board = coordinates.select do |coords|
      coords[0] >= 0 && coords[0] < height && coords[1] >= 0 && coords[1] < width
    end

    #get the values at the neighbouring coordinates
    coordinates_in_board.collect do |coords|
      board[coords[0]][coords[1]]
    end
  end
end

mygame = Game_of_life.new
mygame.start


#old stuff
#create a new board with the updated values from one turn
#def next_turn(board)
#  #todo create a new board with the same dimensions as the old board
#  #new_board = ...
#
#  #iterate over each cell in the board and calculate it's value by calling next_cell_value
#  board.each_with_index do |cells, row|
#    cells.each_with_index do |cell, column|
#
#      @cell = cell
#      @row = row
#      @column = column
#
#      #todo save the next cell value in new_board variable at the same row, column
#      next_cell_value(board,row,column)
#
#      File.open("new_board.txt", "w+") do |f|    #to_do fix "w+"
#        f.write(@test)
#      end
#
#      @board.each do |new_cell|
#        @test = new_cell.map { |p| p }.join("")
#      end
#    end
#  end
#
#  #todo return new_board
#end
#
##calculate the next value for a particular cell
#def next_cell_value(board, row, column)
#  neighbours(board,row,column)  #get neighbours
#
#  #apply rules
#  #return cell value
#end
#
##return an array with the values of the cells neighbouring to the position x,y
#def neighbours(board,row,column)
#  x = @row
#  y = @column
#
#  puts "row = #{row} and column = #{column}"
#
#  #if x,y is in the middle of the board this should return 8 cells
#  #if x,y is in a corner it should return 3
#  #if x,y is in the edge of a row it should 5
#
#  #test it works for all four corners of the board
#  #puts @board[3][4]  #wrote it, just to test, next time will work on this method
#
#  #return an array with the values of the neighbouring cells, don't worry about the positions
#  # e.g. [0,0,0] would be a corner cell with neighbours that are not alive
#  # [0,*,0] would have one neighbour alive etc. - it doesn't matter which order or position each cell is in
#end