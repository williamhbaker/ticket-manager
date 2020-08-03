class CommentsController < ApplicationController
  before_action :require_user
  before_action :set_ticket, only: [:edit, :create, :destroy, :update]
  before_action :set_comment, only: [:edit, :destroy, :update]

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "The comment was updated."
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.ticket = @ticket

    if @comment.save
      flash[:notice] = 'Comment added.'
    else
      flash[:error] = 'Comment body cannot be blank.'
    end

    redirect_to ticket_path(@ticket)
  end

  def destroy
    @comment.delete
    flash[:notice] = 'Comment deleted.'
    redirect_to ticket_path(@ticket)
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
