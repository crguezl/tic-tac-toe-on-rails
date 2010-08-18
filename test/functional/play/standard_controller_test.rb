require File.dirname(__FILE__) + '/../../test_helper'
require 'play/standard_controller'

# Re-raise errors caught by the controller.
class Play::StandardController; def rescue_action(e) raise e end; end

class Play::StandardControllerTest < Test::Unit::TestCase
  def setup
    @controller = Play::StandardController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
