class Player
  attr_accessor :player_id
  attr_accessor :position
  
  def initialize(id)
    @player_id = id
    @position = 0
  end

  def get_position
    return @position
  end

  def get_id
    return @player_id
  end

  # in case of 6, player has an option to roll again, edge cases of double 6, or triple 6 not handled
  def roll_dice
    dice = 1 + rand(6)
    puts "Player #{player_id} is rolling the dice.... #{dice}"
    move(dice)
    
    if dice == 6
      puts "Do  you want to roll again?(Y/n)"
      input = gets
      if input.chomp.casecmp('Y') == 0
        dice = 1 + rand(6)
        puts "Player #{player_id} is rolling dice again... #{dice}"
        move(dice)
      end
    end
  end

  def move dice
    if (@position + dice) <= 100
      @position += dice
      
      # go to endpoint
      new_pos = $game.board.check_snake_or_ladder(@position)
      if new_pos > @position
        puts "Climbing up the ladder"
      elsif new_pos < @position
        puts "Dropping down..."
      end
      @position = new_pos
    end
  end
end
