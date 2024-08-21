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

    def create
        @article = Article.new(article_params)
        if @article.save
          redirect_to article_path(@article)
        else
          render :new
        end
      end

    def destroy
        article = Article.find(params[:id])
        article.destroy!
        redirect_to root_path, notice: '削除に成功しました'

    end

    private
  def article_params
    params.require(:article).permit(:title, :content)
  end

end

