class ArticlesController <  ApplicationController
  #他のアクションに影響しないようにonlyを使う。
  before_action :set_article, only: [:show, :edit, :update]
  #ログインしないと使えない
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    #データの一覧を表示する
    def index
        # Articleのデータベースにある「すべて」のデータを取得。それをインスタンス編集(@article)に代入
        @articles = Article.all
    end

    def show
        #paramsのidとするのがrailsのルールのようなもの
        #@article = Article.find(params[:id])
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
            flash.now[:error] = '保存に失敗したよ'
          render :new
        end
      end

      def edit
        #editページに飛ぶ
        #@article = Article.find(params[:id])
      end

      def update
        #@article = Article.find(params[:id])
        if @article.update(article_params)
          redirect_to article_path(@article), notice:'更新できたよ'
        else
          flash.now[:error] = '更新できなかったよ'
          render :edit
        end

      end

    def destroy
      #ここでしか使わない変数なので@を付けていない
        article = Article.find(params[:id])
        article.destroy!
        redirect_to root_path, notice: '削除に成功したよ'

    end

    private
  def article_params
    params.require(:article).permit(:title, :content)
  end

#before_actionでアクションの前に実行される内容、同じコードを記述しないようにする概念があるため。
#これは、@が付いているインスタンス変数だから自由に使えるようになっているので、実現できている。
  def set_article
    @article = Article.find(params[:id])
  end

end
