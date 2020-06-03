Rails.application.routes.draw do
  root to: 'show#index'
  get 'get_data/index'
  get 'comments/:id', to: 'show#comments',:as => "comments"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
