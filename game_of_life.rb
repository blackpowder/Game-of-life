class Game_of_life

  def initialize
    @board = []
    File.open("starting_board.txt", "r") do |file|
      @content = file.read
      puts @content
      @content.lines.each do |line|
        @board << line.strip.split(//)
      end
    end
  end

  #call next turn and save the outputs to a new file
  def start
    p @board
    new_board = next_turn(@board)
    p new_board

    File.open("new_board.txt", "w+") do |f|    #to_do fix "w+"
      new_board.each do |row|
        f.write row.join + "\n"
      end
    end
  end

  #create a new board with the updated values from one turn
  def next_turn(board)
    new_board = @board.clone

    #iterate over each cell in the board and calculate it's value by calling next_cell_value
    board.each_with_index do |cells, row|
      cells.each_with_index do |cell, column|
        new_board[row][column] = next_cell_value(board, row, column)
      end
    end
    new_board
  end

  def next_cell_value(board, row, column)
    '0'
    #todo get neighbours of current cell
    neighbours = neighbours_of(board, row, column)

    #todo calculate new cell value
    #Any live cell with fewer than two live neighbours dies, as if caused by under-population.
    #Any live cell with two or three live neighbours lives on to the next generation.
    #Any live cell with more than three live neighbours dies, as if by overcrowding.
    #Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
  end

  #return the neighbours of the cell at row, column
  def neighbours_of(board, row, column)
    #change the array returned to test the different calculations in next_cell_value
    ['*','0','0']
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