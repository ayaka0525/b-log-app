class CommentsController < ApplicationController
    def new
      article = Article.find(params[:article_id])
      @comment = article.comments.build
    end


  def create
    #routesで作成されたurlにarticle_idがあるので取得
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    
    if @comment.save
        #記事詳細ページに戻る
      redirect_to article_path(article), notice: 'コメントを追加'
    else
        #投稿ページに留まる
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  private
  def comment_params
    #ストロングパラメーター(コメントの中のcontent'しか'保存しないよ)
    params.require(:comment).permit(:content)
  end

  end