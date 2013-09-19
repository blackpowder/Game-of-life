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
