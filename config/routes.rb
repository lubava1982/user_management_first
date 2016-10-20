Rails.application.routes.draw do

   root "users#index"
   get '/users/new' => 'users#show_new_user_form'
   post '/users/create' => 'users#enter_user_info'
   get '/users/:id' => 'users#show'
   get '/users/:id/edit' => 'users#edit'
   patch '/users/:id' => 'users#update'
   delete '/users/:id' => 'users#destroy'
   
 
end
