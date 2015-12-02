class WikisController < ApplicationController

  def index
    @wikis = current_user.wikis
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)

     if @wiki.save
       flash[:notice] = "Wiki was successfully saved."
       redirect_to current_user
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :new
     end
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title)
    params.require(:wiki).permit(:body)
  end

end
