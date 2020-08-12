Rails.application.routes.draw do

  post "login" => "users#login_act"
  get "login" => "users#login"
  post "logout" => "users#logout"
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"

  post "memos/:id/like" => "memos#like"
  post "memos/:id/unlike" => "memos#unlike"
  get "memos/new" => "memos#new"
  post "memos/create" => "memos#create"
  get "memos/list" => "memos#list"
  get "memos/:id/edit" => "memos#edit"
  post "memos/:id/update" => "memos#update"
  post "memos/:id/destroy" => "memos#destroy"

  get "/" => "home#top"

end
