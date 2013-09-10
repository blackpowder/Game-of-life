class Game_of_life
  def initialize
    File.open("starting_board.txt", "r") do |file|
      @f = file.read
      puts @f
    end
  end

  def new_generation
    @board = []
      @f.lines.each do |line|
        @board << line.split(//)
      end
  
    puts @board.inspect
  end

  def start
    #call next turn and save the outputs to a new file
    #new_board = next_turn(@board) #then save new_board to new_board.txt
    new_generation
  end

  #return an array with the values of the cells neighbouring to the position x,y
  def neighbours(x,y)

    #if x,y is in the middle of the board this should return 8 cells
    #if x,y is in a corner it should return 3
    #if x,y is in the edge of a row it should 5

    #test it works for all four corners of the board

  end

  #create a new board with the updated values from one turn
  def next_turn
    #iterate over each cell in the board and calculate it's value

  end

  #calculate the next value for a particular cell
  def next_cell_value(x,y)
    #get neighbours
    #apply rules
    #return cell value
  end
end

mygame = Game_of_life.new
mygame.start




