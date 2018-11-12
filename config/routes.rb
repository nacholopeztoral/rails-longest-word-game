Rails.application.routes.draw do
  get 'games/new', to: 'games#new', as: :new

  post 'games/score', to: 'games#score', as: :score

  get 'games/score', to: 'games#score', as: :scores
end
