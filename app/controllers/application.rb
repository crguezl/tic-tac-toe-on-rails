
class ApplicationController < ActionController::Base
  # session key
  session :session_key => 'tic_tac_toe'
  
  def current_user
    if session[:player_id].nil? then
      session[:player_id] = Player.create(:title => 'player').id
    end
    
    return @current_user ||= Player.find_by_id(session[:player_id])
  end
  
  helper_method :current_user
  
end
