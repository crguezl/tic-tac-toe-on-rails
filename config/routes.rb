TicTacToeOnRails::Application.routes.draw do

  match 'home' => 'Home#index'
  match 'download' => 'Download#index'
  match 'credit' => 'Credit#index'
  match 'terms_of_use' => 'TermsOfUse#index'

  match 'play/standard' => 'Play::Standard#index'
  match 'play/standard/receive_move_by_player(/:game_id)(/:drop_zone)' => 'Play::Standard#receive_move_by_player'
  match 'play/standard/receive_move_by_application(/:game_id)' => 'Play::Standard#receive_move_by_application'

  root :to => 'home#index'
end
