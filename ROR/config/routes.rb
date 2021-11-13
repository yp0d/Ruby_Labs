Rails.application.routes.draw do
  root 'labs#index'
   get '/labs/new', to: 'labs#new', as:'new_lab'
   get '/labs/:id', to: 'labs#show', as: 'lab'
   post '/labs', to: 'labs#create'
   get '/labs/:id/edit' ,to: 'labs#edit' , as: 'edit_lab'
   put '/labs/:id' , to: 'labs#update'
   patch '/labs/:id' , to: 'labs#update'
   delete '/labs/:id', to: 'labs#destroy'
  get '/labs/:id/mark', to: 'labs#mark', as: 'mark_lab'
  post '/labs/:id/mark' , to: 'labs#grade'
  # resources :labs
end
