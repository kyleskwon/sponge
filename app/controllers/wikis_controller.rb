class WikisController < ApplicationController

  def index
    @wikis = current_user.wikis
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
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]

     if @wiki.save
       flash[:notice] = "Wiki was successfully saved."
       redirect_to welcome_index_path
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :new
     end
   end

   def destroy
     @wiki = current_user.wikis.find(params[:id])
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