Rails.application.routes.draw do
  root to: 'items#index'

  resources :items do
    get :loadArticles
  end
end
