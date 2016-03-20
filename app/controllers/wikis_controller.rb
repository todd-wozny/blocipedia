class WikisController < ApplicationController
  before_filter :find_wiki, only: [:edit, :show, :destroy]
  before_filter :wikis, only: [:index]
  
  def index
  end

  def show
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    if Wiki.create(wiki_params)
      redirect_to wikis_path, notice: "Wiki was saved."
    else
      render :new, alert: "There was an error saving the wiki. Please try again."
    end
  end

  def edit
  end
  
  def destroy
  end
  
  private 
  
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
  
  def find_wiki
    @wiki ||= Wiki.find(params[:id])
  end
  
  def wikis
    @wikis ||= Wiki.all
  end
 
end


#refactoring

