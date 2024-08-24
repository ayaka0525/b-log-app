Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'articles#index'

#index以外のURLを使用しているので、onlyを外した。
  resources :articles do
    #記事の下にcomment URLが生成される。
  resources :comments, only: [:new, :create]
  end

end
