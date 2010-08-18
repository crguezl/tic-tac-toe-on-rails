require File.dirname(__FILE__) + '/../test_helper'

class GameTest < Test::Unit::TestCase
	fixtures :players
	fixtures :games
	fixtures :moves

  # Replace this with your real tests.
  def test_game_is_invalid_when_moves_are_invalid
    
    game = Game.new()
    game.moves << get_move_1
    game.moves << get_move_2
    
    # assert game.valid?, game.errors.full_messages
    assert (not game.valid?)
  end
  
  def test_game_over_one
  	game = get_game_2
  	game.moves << get_move(game.player_x, 0, 0)
  	game.moves << get_move(game.player_x, 0, 1)
  	game.moves << get_move(game.player_x, 0, 2)
  	game.moves << get_move(game.player_x, 1, 0)
  	game.moves << get_move(game.player_x, 1, 1)
  	game.moves << get_move(game.player_x, 1, 2)
  	game.moves << get_move(game.player_x, 2, 0)
  	game.moves << get_move(game.player_x, 2, 1)
  	game.moves << get_move(game.player_x, 2, 2)
  	  	  	  	  	  	  	  	  	
		assert game.game_over?
  end
  
  def test_game_is_not_over
  	game = get_game_2
  	game.moves << get_move(game.player_x, 0, 0)

		assert (not game.game_over?)
  end
  
  def test_game_is_equalized
  	game = get_game_2
  	
  	# x|o|x
  	# o|o|x
  	# x|x|o
  	game.moves << get_move(game.player_x, 0, 0)
  	game.moves << get_move(game.player_o, 0, 1)
  	game.moves << get_move(game.player_x, 0, 2)
  	game.moves << get_move(game.player_o, 1, 0)
  	game.moves << get_move(game.player_o, 1, 1)
  	game.moves << get_move(game.player_x, 1, 2)
  	game.moves << get_move(game.player_x, 2, 0)
  	game.moves << get_move(game.player_x, 2, 1)
  	game.moves << get_move(game.player_o, 2, 2)  	
  	
  	assert game.game_equalized?  	
  end
  
  def test_simple_game_is_not_equalized
  	game = get_game_2
  	
  	# all plays are by the same player so it could not be equalized
  	game.moves << get_move(game.player_x, 0, 0)
  	game.moves << get_move(game.player_x, 0, 1)
  	game.moves << get_move(game.player_x, 0, 2)
  	game.moves << get_move(game.player_x, 1, 0)
  	game.moves << get_move(game.player_x, 1, 1)
  	game.moves << get_move(game.player_x, 1, 2)
  	game.moves << get_move(game.player_x, 2, 0)
  	game.moves << get_move(game.player_x, 2, 1)
  	game.moves << get_move(game.player_x, 2, 2)  	
  	
  	assert game.game_equalized?
  end
  
  def test_simple_game_is_not_equalized
  	game = get_game_2
  	game.moves << get_move(game.player_x, 0, 0)

		assert (not game.game_equalized?)
  end  

	def test_game_is_not_won_01
  	game = get_game_2
  	
  	# x|o|x
  	# o|o|x
  	# x|x|o
  	game.moves << get_move(game.player_x, 0, 0)
  	game.moves << get_move(game.player_o, 0, 1)
  	game.moves << get_move(game.player_x, 0, 2)
  	game.moves << get_move(game.player_o, 1, 0)
  	game.moves << get_move(game.player_o, 1, 1)
  	game.moves << get_move(game.player_x, 1, 2)
  	game.moves << get_move(game.player_x, 2, 0)
  	game.moves << get_move(game.player_x, 2, 1)
  	game.moves << get_move(game.player_o, 2, 2)  	
  	
  	assert (not game.game_won?)
	end  

	def test_game_is_not_won_02
  	game = get_game_2
  	
  	# x|-|-
  	# x|-|-
  	# x|-|-
  	game.moves << get_move(game.player_x, 0, 0)
  	game.moves << get_move(game.player_x, 0, 1)
  	game.moves << get_move(game.player_x, 0, 2)
  	
  	# requires 5 moves before a win
  	assert (not game.game_won?)
	end    
	
	def test_game_is_not_won_03
  	game = get_game_2
  	
  	# x|-|o
  	# x|o|-
  	# x|-|-
  	game.moves << get_move(game.player_x, 0, 0)
  	game.moves << get_move(game.player_x, 0, 1)
  	game.moves << get_move(game.player_x, 0, 2)
  	game.moves << get_move(game.player_o, 2, 0)
  	game.moves << get_move(game.player_o, 1, 1)
  	
  	# this would be a win except 
  	# a win is only given if on the last move
  	# makes this seem like maybe not the best design?
  	assert (not game.game_won?)
	end    	
	
	def test_game_is_won_01
  	game = get_game_2
  	
  	# x|-|o
  	# x|o|-
  	# x|-|-
  	game.moves << get_move(game.player_x, 0, 0)
  	game.moves << get_move(game.player_o, 2, 0)
  	game.moves << get_move(game.player_x, 0, 1)
  	game.moves << get_move(game.player_o, 1, 1)
  	game.moves << get_move(game.player_x, 0, 2)
  	
  	assert game.game_won?
	end 	
	
	def test_game_is_won_02
  	game = get_game_2
  	
  	# x|o|o
  	# o|o|x
  	# x|x|x
  	game.moves << get_move(game.player_x, 0, 0)
  	game.moves << get_move(game.player_o, 0, 1)
  	game.moves << get_move(game.player_o, 0, 2)
  	game.moves << get_move(game.player_o, 1, 0)
  	game.moves << get_move(game.player_o, 1, 1)
  	game.moves << get_move(game.player_x, 1, 2)
  	game.moves << get_move(game.player_x, 2, 0)
  	game.moves << get_move(game.player_x, 2, 1)
  	game.moves << get_move(game.player_x, 2, 2)  	
  	
  	assert game.game_won?
	end  	
	
	def test_create_move_01
		game = get_game_4 # has 0,0
		
		move = game.create_move
		assert_not_equal(true, (move.x_axis == 0 and move.y_axis == 0))
		#assert_not_equal 0, move.x_axis
		#assert_not_equal 0, move.y_axis
		
		move.title = "move"
		move.player = get_player_1
		game.moves << move
		assert game.valid?, game.errors.full_messages
		assert move.valid?, move.errors.full_messages
	end
end
