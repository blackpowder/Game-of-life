class Game_of_life

	def initialize

		#todo open file
		#todo get board
		@board = []
		File.open("starting_board2.txt", "r") do |file|
			file.each_line do |line|
			  @board << line.strip.split(//)
			end
		end	
		#puts @board.inspect	
	end

	def start()
		#todo call get_next_generation some numbers of time
		#todo board to new text file
		#todo close text file 

		File.open("new_board2.txt", "w") do |file|
			5.times do
			new_board = get_next_generation
				new_board.each do |row|
	        	file.write row.join + "\n"
				end
				file.write "\n"
			end
		end
		puts File.read("new_board2.txt") 
	end

	def get_next_generation()
		"*"
		#todo loop of each cell
		#todo for each cell : call get_neighbourhs

		@board.each do |row|
			row.each do |cell|
			puts get_neighbours
			end
		end

		#todo rules 
		#print each new cells onto new board at location x,y
		#return back to start
	end

	def get_neighbours
		["*", ".", "*", "*"]
		#todo get the location (x, y) of each neighbours
		#todo add neighbours if they are not off the board 
		#return neighbours back to GET_NEXT_GENERATION
	end
end


mygame = Game_of_life.new
mygame.start
