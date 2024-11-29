Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  scope module: :public do
    resources :customers, only: [:update, :edit, :desteoy, :show]
    resources :items, only: [:index, :update, :create, :destroy, :destroy_all]
    resources :cart_items, only: [:index, :update, :create, :destroy, :destroy_all]
    resources :addresses, only: [:index, :create, :update, :show, :edit]
    resources :orders, only: [:new, :index, :show, :create]
      get 'orders/confirm', to: 'orders#confirm'
      get 'orders/thanks', to: 'orders#thanks'
  end


  root to: 'homes#top'

  get 'homes/about', as: 'about'

end
