class CommentsController < ApplicationController
  before_action :load_comment, except: %i(new create index)

  def index; end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new comment_params

    respond_to :js if @comment.save
  end

  private
  
  def comment_params
    params.require(:comment).permit Comment::COMMENT_PARAMS
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]

    return if @comment
    flash[:danger] = t "error"
    redirect_to root_path
  end
end
