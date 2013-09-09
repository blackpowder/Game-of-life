class Game_of_life
  def initialize
    File.open("game_of_life.txt", "r") do |file|
      @f = file.read
      puts @f
    end
  end

  def new_generation
    a = []
    File.open('game_of_life.txt') do |f|
      f.lines.each do |line|
        a << line.split(//)
      end
    end

    puts a.inspect
  end

  def start
    new_generation
  end
end

mygame = Game_of_life.new
mygame.start




