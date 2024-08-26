Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'articles#index'

  #index以外のURLを使用しているので、onlyを外した。
  resources :articles do
  #記事の下にcomment URLが生成される。
  resources :comments, only: [:new, :create]
  #いいねできるように生成・削除でハート画像が変わる
  resource :like, only: [:create, :destroy]
  end
  #プロフィールは１個なのでidを指定しなくてよく、urlにindex/:idがいらないから'resource'単数を使う。
  resource :profile, only: [:show, :edit, :update]

  #いいねの数を取得するためのURL
  resources :favorites, only: [:index]

end
