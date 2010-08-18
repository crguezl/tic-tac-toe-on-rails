require File.dirname(__FILE__) + '/../test_helper'
require 'terms_of_use_controller'

# Re-raise errors caught by the controller.
class TermsOfUseController; def rescue_action(e) raise e end; end

class TermsOfUseControllerTest < Test::Unit::TestCase
  def setup
    @controller = TermsOfUseController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
