class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find(11))
    if @gossip.save
      redirect_to @gossip
      flash[:notice] = 'Ton gossip a bien était enregistré'
    else
      render 'new'
    end
  end
end
