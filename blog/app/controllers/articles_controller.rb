class ArticlesController < ApplicationController
  # By convention, the order of actions in a controller is: index, show,
  # new, edit, create, update, destroy. These methods must all be publc (and
  # declared before the private section).
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    # render plain: params[:article].inspect

    # Instantiate a new Article, intitailzing it with the form
    # parameters from views/articles/new.html.erb.
    @article = Article.new(article_params)

    # Save to the database. Mapping for params to database columns
    # is automagic.
    @article.save
    # Show the article.
    redirect_to @article
  end

  private

  # Validate the parameters passed when creating a new Article instance.
  # Checks are made that the required fields are present, and that all of
  # the fields submitted are permitted.
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
