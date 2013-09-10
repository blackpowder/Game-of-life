class Game_of_life

  def initialize
    @board = []
    File.open("starting_board.txt", "r") do |file|
      @content = file.read
      puts @content
      @content.lines.each do |line|
        @board << line.split(//)


      end
    end
  end

  def start
    #call next turn and save the outputs to a new file
    new_board = next_turn(@board)
    new_board
    puts @board.inspect
  end

  #create a new board with the updated values from one turn
  def next_turn(board)

    #create a new board
    next_cell_value(@x,@y) #iterate over each cell in the board and calculate it's value by calling next_cell_value
    
   
    #save the value in a new board variable at the same row, column
    #return new board
  end

  #calculate the next value for a particular cell
  def next_cell_value(x,y)
    neighbours(@x,@y)  #get neighbours
    #apply rules
    #return cell value
  end

  #return an array with the values of the cells neighbouring to the position x,y
  def neighbours(x,y)

    #if x,y is in the middle of the board this should return 8 cells
    #if x,y is in a corner it should return 3
    #if x,y is in the edge of a row it should 5

    #test it works for all four corners of the board
    puts @board[3][4]  #wrote it, just to test, next time will work on this method

    #return an array with the values of the neighbouring cells, don't worry about the positions
    # e.g. [0,0,0] would be a corner cell with neighbours that are not alive
    # [0,*,0] would have one neighbour alive etc. - it doesn't matter which order or position each cell is in
  end
end

mygame = Game_of_life.new
mygame.start




