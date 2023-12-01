Rails.application.routes.draw do

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # 管理者
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
  end

  # 一般ユーザー
  devise_for :user, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
      root "homes#top"
      get "about" => "homes#about"
  end
end
