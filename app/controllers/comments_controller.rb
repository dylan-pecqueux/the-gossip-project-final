class CommentsController < ApplicationController
 before_action :find_gossip!
 before_action :authenticate_user, only: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @gossip.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to gossip_path(find_gossip!)
     flash[:notice] = 'Ton commentaire est en ligne'
    else
      render gossip_path(find_gossip!)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    post_params = params.require(:comment).permit(:content)
    if @comment.update(post_params)
      redirect_to gossip_path(find_gossip!)
      flash[:notice] = 'Ton commentaire a bien étais modifié'
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(find_gossip!)
  end

  private

  def find_gossip!
    @gossip = Gossip.find(params[:gossip_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte-toi"
      redirect_to new_session_path
    end
  end
end
