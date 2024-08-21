class ArticlesController <  ApplicationController
    #データの一覧を表示する
    def index
        # Articleのデータベースにある「すべて」のデータを取得。それをインスタンス編集(@article)に代入
        @articles = Article.all
    end

    def show
        #paramsのidとするのがrailsのルールのようなもの
        @article = Article.find(params[:id])
    end

end

