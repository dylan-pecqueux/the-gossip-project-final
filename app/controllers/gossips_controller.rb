class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:show, :new, :create]
  before_action :is_author?, only: [:edit, :update, :destroy]

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @tag = Tag.all
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
    if @gossip.save
      params[:tag].try(:each) do |i|
        @linktag = Linktag.new(tag_id: Tag.find(i).id, gossip_id: @gossip.id)
        @linktag.save
      end
      redirect_to @gossip
      flash[:notice] = 'Ton gossip a bien était enregistré'
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(post_params)
      redirect_to @gossip
      flash[:notice] = 'Ton gossip a bien était modifié'
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to "/"
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte-toi"
      redirect_to new_session_path
    end
  end

  def is_author?
    @gossip = Gossip.find(params[:id])
    unless current_user == @gossip.user
      flash[:danger] = "action impossible, tu n'es pas l'auteur"
      redirect_to @gossip
    end
  end
end
