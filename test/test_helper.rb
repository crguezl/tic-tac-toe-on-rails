ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class Test::Unit::TestCase
  # Transactional fixtures accelerate your tests by wrapping each test method
  # in a transaction that's rolled back on completion.  This ensures that the
  # test database remains unchanged so your fixtures don't have to be reloaded
  # between every test method.  Fewer database queries means faster tests.
  #
  # Read Mike Clark's excellent walkthrough at
  #   http://clarkware.com/cgi/blosxom/2005/10/24#Rails10FastTesting
  #
  # Every Active Record database supports transactions except MyISAM tables
  # in MySQL.  Turn off transactional fixtures in this case; however, if you
  # don't care one way or the other, switching from MyISAM to InnoDB tables
  # is recommended.
  self.use_transactional_fixtures = true

  # Instantiated fixtures are slow, but give you @david where otherwise you
  # would need people(:david).  If you don't want to migrate your existing
  # test cases which use the @david style and don't mind the speed hit (each
  # instantiated fixtures translates to a database query per test method),
  # then set this back to true.
  self.use_instantiated_fixtures  = false

  # Add more helper methods to be used by all tests here...
  # *****************************************************
  # *****************************************************
  # helpers
  def get_game_1
  	game = Game.find(1)
  	return game
  end

  def get_game_2
  	# no moves are attached to this record
  	game = Game.find(2)
  	return game
  end
  
  def get_game_3
  	# no moves are attached to this record
  	game = Game.find(3)
  	return game  	
  end
  
  def get_game_4
  	game = Game.find(4)
  	return game  	
  end  
  
  def get_player_1
  	return Player.find(1)
  end  
  
  def get_move_1
  	move = Move.find(1)
  	move.game = nil
  	
  	return move
  end
  
  def get_move_2
  	move = Move.find(2)
  	move.game = nil
  	
  	return move
  end  
  
  def get_move(player, x, y)
  	move = Move.new(:title => 'Move #{x}, #{y}')
  	move.player = player
  	move.x_axis = x
  	move.y_axis = y
  	
  	return move
  end
end
