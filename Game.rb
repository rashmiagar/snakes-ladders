require 'Player'
require 'Board'
require 'Cell'

class Game 
  attr_accessor :players
  attr_reader :board
  attr_accessor :current_player

  def initialize(n=2)
    puts "Initializing players.....#{n}"
  
    @players = []
    (0...n).each do |i|
      @players[i] = Player.new(i+1)
    end

    puts "Initializing Board...."
    @board = Board.new
    current_player = 1
  end

  def play
    # 1. roll the dice
    # 2. Check if 6 then roll again (optional)
    # 3. Move the player
    # 4. Check if snake/ladder
    # 5. Check if winner
    # 6. No, then repeat for next player
    #   Yes, then end
    while ((winner = check_winner).empty?) do
      (0...@players.size).each do |i|
        current_player = @players[i]
        current_player.roll_dice
        puts "Player #{current_player.get_id} : #{current_player.get_position}"
      end
    end
    puts "Winner is Player #{winner.first.get_id}"
    (0...@players.size).each do |i|
      puts "Player #{i+1}: #{@players[i].get_position}"
    end
  end

  def check_winner
    return @players.select {|e| e.get_position == 100}
  end
end


$game = Game.new
$game.play
