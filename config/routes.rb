Rails.application.routes.draw do
  # 管理者
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
  end

  # 一般ユーザー
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root "homes#top"
    get "about" => "homes#about"

    get     "users/:account_name",                to: "users#show",                 as: :user_profile
    get     "users/:account_name/edit",           to: "users#edit",                 as: :edit_user_profile
    patch   "users/:account_name",                to: "users#update",               as: :update_user_profile
    get     "users/:account_name/artworks",       to: "users#artworks",             as: :user_artworks
    get     "users/:account_name/liked_artworks", to: "users#liked_artworks",       as: :user_liked_artworks
    post    "users/:account_name/relationships",  to: "relationships#create",       as: :user_follow
    delete  "users/:account_name/relationships",  to: "relationships#destroy",      as: :user_unfollow
    get     "users/:account_name/followings",     to: "relationships#followings",   as: :user_followings
    get     "users/:account_name/followers",      to: "relationships#followers",    as: :user_followers
    get     "confirm_deactivation",               to: "users#confirm_deactivation", as: :confirm_deactivation
    patch   "deactivate",                         to: "users#deactivate",           as: :deactivate

    resources :artworks do
      collection do
        post :initialize_editor, defaults: { format: "js" }
      end
      resource  :likes,     only: [:create, :destroy], defaults: { format: "js" }
      resources :comments,  only: [:create, :destroy], defaults: { format: "js" }
    end
  end
end
