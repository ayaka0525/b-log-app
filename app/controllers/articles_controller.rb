class ArticlesController <  ApplicationController
    def index
        # Articleのデータベースにある最初のデータを取得。それをインスタンス編集(@article)に代入
        @article = Article.first
    end

    def about

    end

end

