Rails.application.routes.draw do
  # 管理者
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root "homes#top"

    get   "users",                    to: "users#index",  as: :users
    get   "users/:account_name",      to: "users#show",   as: :user
    get   "users/:account_name/edit", to: "users#edit",   as: :edit_user
    patch "users/:account_name",      to: "users#update", as: :update_user

    resources :artworks, only: %i[index show edit update destroy]
    resources :comments, only: %i[index destroy]
    resources :reports,  only: %i[index show edit update] do
      member do
        post :update_status
      end
    end
  end

  # 一般ユーザー
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :user do
    post "guest_sign_in", to: "public/sessions#guest_sign_in"
  end

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

    resources :artworks, except: %i[create] do
      collection do
        post :setup_editor,       defaults: { format: "js" }
        post :initialize_editor,  defaults: { format: "js" }
        post :save,               defaults: { format: "json" }
        post :confirm_upload,     defaults: { format: "js" }
      end

      resource  :likes,     only: %i[create destroy], defaults: { format: "js" }
      resources :comments,  only: %i[create destroy], defaults: { format: "js" }
    end

    resources :reports, only: :create do
      collection do
        post :make, defaults: { format: "js" }
      end
    end
  end
end
