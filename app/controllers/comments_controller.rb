class CommentsController < ApplicationController

    def create
        @entry = Entry.find(params[:entry_id])
        @comment = @entry.comments.create(comment_params)
        if @comment
            @user_comment = UserComment.create(:user_id => params[:comment][:user_id], :comment_id => @comment.id)
            return @comment.destroy if !@user_comment
        end
        redirect_to entry_path(@entry)
    end

    private
        def comment_params
            params.require(:comment).permit(:title)
        end

end
