ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

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
