Rails.application.routes.draw do
    devise_for :users

    authenticated :user do
        get '/dashboard', to: 'bios#edit'
        patch '/dashboard', to: 'bios#update'
    end

    root to: 'home#index'

    get ':username', to => 'bios#show', as: :public_profile
end