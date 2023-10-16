class ListCommentsController < ApplicationController
  def create
    list = List.find(params[:list_id])
    comment = current_user.list_comments.new(list_comment_params)
    comment.list_id = list.id
    if comment.save
      redirect_to list_path(list)
    end
  end
  
  def destroy
    ListComment.find(params[:id]).destroy
    redirect_to list_path(params[:list_id])
  end
  
  private
  def list_comment_params
    params.require(:list_comment).permit(:comment)
  end
end
