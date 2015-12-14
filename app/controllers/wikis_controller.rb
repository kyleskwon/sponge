class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)
     if @wiki.save
       flash[:notice] = "Wiki was successfully saved."
       redirect_to welcome_index_path
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :new
     end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
     @wiki = Wiki.find(params[:id])
     @wiki.assign_attributes(wiki_params)
     authorize(@wiki)

     if @wiki.save
       flash[:notice] = "Wiki was successfully saved."
       redirect_to welcome_index_path
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :edit
     end
   end

   def destroy
     @wiki = Wiki.find(params[:id])
     authorize(@wiki)
     @wiki.destroy

     respond_to do |format|
       format.html { redirect_to current_user }
       format.js
     end
   end

  private

  def set_user
    @user = current_user
  end

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
