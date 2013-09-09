class Game_of_life
	def initialize
		File.open("game_of_life.doc", "r") do |file|
		@f = file.read
		puts @f
		end
	end

	def new_generation
		#files = File.open("game_of_life.doc", "w+")
		#puts @f.each_line.to_a
		#puts @f.split(//)
		grid = []



	end
		

	def start
	    new_generation
	end
end


	mygame = Game_of_life.new
	mygame.start




	# to_do lire array 