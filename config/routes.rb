# frozen_string_literal: true

Rails.application.routes.draw do
  resources :reviews, except: %i[new edit]
  get '/work_spaces/top_rated' => 'work_spaces#top_rated'
  resources :work_spaces, except: %i[new edit]
  # RESTful routes
  resources :examples, except: %i[new edit]
  resources :work_spaces do
    member do
      put 'like', to: 'work_spaces#upvote'
      put 'unlike', to: 'work_spaces#downvote'
      get 'likes', to: 'work_spaces#like'
    end
  end

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
  patch '/update-user' => 'users#update'
  get '/show-user' => 'users#showuser'
  get '/checkname' => 'users#checkname'
  get '/checkemail' => 'users#checkemail'
end
