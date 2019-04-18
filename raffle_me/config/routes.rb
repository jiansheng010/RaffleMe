# 4/8/2019 - Added login, play, manage, cid, and delete_disconnected routes - Tom Paoloni
# 4/10/2019 - Added skeleton authentication routes - Brandon Arbuthnot
# 4/15/2019 - Added team, faq, and gnu routes - JS Teoh
# ? - Added questions routes - Austin Pearce
# 4/16/2019 - Added raffle_started and add_points_to_entrant route  - JS Teoh

Rails.application.routes.draw do
  post '/add_points_to_entrant' => 'raffle_started#addPointsToEntrant'
  post '/raffle_started' => 'raffle_started#raffle_started'
  get '/raffle_started/:roomcode/:username' => 'raffle_started#raffle_started'
  get '/raffle_before_results/:roomcode' => 'raffle_started#raffle_before_results'
  resources :raffles
  devise_for :users
  devise_for :models

  unauthenticated do
    root to: 'landing#index'
    get '/questions', to: redirect('/')
  end

  post '/cid' => 'room#cid'

  # @To-do Build dashboard view
  authenticated do
    root to: 'landing#dashboard'
    get '/questions' => 'questions#index'
    post '/questions' => 'questions#new'
    delete '/questions' => 'questions#delete'
  end

  post '/home' => 'room#delete_entrant'

  get '/play' => 'room#play'
  post '/play' => 'room#play'

  get '/results/:id' => 'results#index'

  get '/manage/:id' => 'room#manage'
  post '/manage' => 'room#manage_post'

  get '/faq' => 'faq#faq_display'
  get '/gnu' => 'faq#gnu_display'
  get '/team' => 'faq#team_display'

  post '/deleteroom' => 'room#delete_user_room'
end
