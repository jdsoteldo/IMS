Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: "home#register"
get '/', to: "home#home"

get '/contact', to: "home#contact"
get '/contact/:name', to: "home#contact"
get '/contact/:name/:lastname', to: "home#contact"
get '/contact/:name/show/:id', to: "home#contact"


root to: "tables#index"
resources :tables #resources genera el CRUD, es una palabra reservada

get '/completed', to: "tables#completed"
get '/completed/:id', to: "tables#completed"

end
