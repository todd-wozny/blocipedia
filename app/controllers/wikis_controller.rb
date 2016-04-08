class WikisController < ApplicationController
  before_filter :find_wiki, only: [:edit, :show, :destroy]
  before_filter :wikis, only: [:index]
  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]
  
  def index
    @renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML,autolink: true, tables: true)
  end

  def show
    @renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML,autolink: true, tables: true)
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    wiki = Wiki.new(wiki_params)
    wiki.user = current_user
    
    if wiki.save
      redirect_to wikis_path, notice: "Wiki was saved."
    else
      @wiki = Wiki.new
      render :new, alert: "There was an error saving the wiki. Please try again."
    end
  end
  
  def update
    @wiki = Wiki.find(params[:id])
 
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.public = params[:wiki][:public]
    @wiki.private = params[:wiki][:private]
 
    if @wiki.save
      flash[:notice] = "Wiki was updated."
     redirect_to @wiki
    else
     flash.now[:alert] = "Error saving wiki. Please try again."
     render :edit
    end
  end

  def edit
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
 
    if @wiki.destroy
       flash[:notice] = "\"#{@wiki.name}\" was deleted successfully."
       redirect_to action: :index
    else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
    end
  end

  
  private 
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :public)
  end
  
  def find_wiki
    @wiki ||= Wiki.find(params[:id])
    
    #unless @wiki.private || current_user
    #   flash[:alert] = "You must be signed in to view private wikis."
    #   redirect_to new_user_session_path
    #end
  end
  
  def wikis
   @wikis ||= Wiki.all
   #@wikis = Wiki.visible_to(current_user)
  end
  
  def authorize_user
     unless current_user.admin?
       flash[:alert] = "You must be an admin to do that."
       redirect_to wikis_path
     end
  end
 
end


#refactoring
