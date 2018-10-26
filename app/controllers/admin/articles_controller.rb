class Admin::ArticlesController < Admin::AdminController
  before_action :authorized_to_access_dashboard?

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_article_path(@article)
      flash[:notice] = "Article was successfully created."
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to admin_root_path
      flash[:notice] = "Article was successfully deleted."
    else
      render 'show'
      flash[:notice] = "Something went wrong. Article was not deleted."
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to admin_root_path
      flash[:notice] = "Article was successfully updated."
    else
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :author, :category_id, :approved)
  end

end
