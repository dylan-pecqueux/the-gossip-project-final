class StaticPagesController < ApplicationController
  def team

  end

  def contact

  end

  def home
    @gossips = Gossip.all
    @gossip_sample = Gossip.all.sample
  end
end
