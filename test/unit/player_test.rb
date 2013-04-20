require File.dirname(__FILE__) + '/../test_helper'

class PlayerTest < ActiveSupport::TestCase
  # fixtures :players

  def test_title_is_required
    p = Player.new()

    # assert p.save, p.errors.full_messages
    assert (!p.save)
  end

end
