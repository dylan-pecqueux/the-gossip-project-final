class GossipsController < ApplicationController
  def gossip_id
    @gossip = Gossip.find(params[:gossip_id])
  end
end
