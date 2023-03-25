class ArticlesController < ApplicationController

  before_action :article_search, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show

  end

  def create
    @article = Article.new(whitelist_params)
    if @article.save
    flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render 'new'
    end

  end

  def new
    @article = Article.new
  end

  def edit
    
  end

  def update
    if @article.update(whitelist_params)
      flash[:notice] = "Article updated successfully"
      redirect_to @article
    else
      render 'edit'
    
    end
  end
  
  def destroy
        @article.destroy
    flash[:notice] = "Article was deleted successfully"
    redirect_to articles_path
  end

  private

  def whitelist_params
    params.require(:article).permit(:title, :description)
  end

  def article_search
    @article = Article.find(params[:id])
  end

end
