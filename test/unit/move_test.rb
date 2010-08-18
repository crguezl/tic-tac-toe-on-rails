require File.dirname(__FILE__) + '/../test_helper'

class MoveTest < Test::Unit::TestCase
  fixtures :moves
	fixtures :players
	fixtures :games
  
  def test_first_move_is_ok
    game = get_game_3
    assert game.save
    
    # valid 1st move
    move = Move.new(:title => '1st')
    move.y_axis = 0
    move.x_axis = 0
    move.player = game.player_x
    game.moves << move    
    assert move.valid?
    assert game.save
  end
  
  def test_move_is_not_ok
    game = get_game_3
    assert game.save
    
    # valid 1st move
    move = Move.new(:title => '1st')
    move.y_axis = 0
    move.x_axis = 0
    move.player = game.player_x
    game.moves << move    
    assert move.valid?
    assert game.save
    
    # invaild 2nd move on same spot as first
    move = Move.new(:title => '2nd')
    move.y_axis = 0
    move.x_axis = 0
    move.player = game.player_x    
    game.moves << move    
    #assert move.valid?, move.errors.full_messages
    assert (not move.valid?)
    assert (not game.save)
  end  
  
  def test_move_invalid_without_game
  	move = Move.new()
  	move.player = get_player_1
  	
  	#assert move.valid?, move.errors.full_messages
  	assert (not move.valid?)
  end
  
  def test_move_invalid_without_player
  	move = Move.new()
  	move.game = get_game_1
  	
  	#assert move.valid?, move.errors.full_messages
  	assert (not move.valid?)
  end  
  
end
