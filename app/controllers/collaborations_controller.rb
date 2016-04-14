class CollaborationsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.where('username LIKE ?', "%#{params[:search]}%")
            .all_except(current_user)
            .exclude_collaborators(@wiki)
            .first
    if @user
      @collaboration = Collaboration.new(wiki: @wiki, user: @user)
      if @collaboration.save
        flash[:notice] = "User successfully added to wiki."
      else
        flash[:error] = "There was a problem adding user. Please try again."
      end
    else
      flash[:error] = "Sorry that wasn't a valid username. Please try again."
    end
      redirect_to @wiki
  end
end
