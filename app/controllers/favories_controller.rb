class FavoritesController < ApplicationController
    #ユーザーがログインしている状態か確認
    before_action :authenticate_user!
      def index
        #お気に入りした記事を取得
        @articles = current_user.favorite_articles
      end
    end