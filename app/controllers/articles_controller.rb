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

    def new
      @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            #flashで表示するためにnoticeを追記
          redirect_to article_path(@article), notice:'保存できたよ'
        else
            #create-actionの中でnewページを表示してる
            #@articleのデータがnewでまた取り込みされるので、formの入力内容は消えない
            flash.now[:error] = '保存に失敗しました'
          render :new
        end
      end

      def edit
        @article = Article.find(params[:id])
      end

    def destroy
      #ここでしか使わない変数なので@を付けていない
        article = Article.find(params[:id])
        article.destroy!
        redirect_to root_path, notice: '削除に成功しました'

    end

    private
  def article_params
    params.require(:article).permit(:title, :content)
  end

end

