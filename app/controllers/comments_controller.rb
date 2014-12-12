class CommentsController < ApplicationController

	def create

		comment = current_user.comments.create(comment_params)
		if comment.save
			redirect_to :back
		else
      flash[:message] = comment.errors.messages
      puts flash
      redirect_to :back
    end

	end

  # this is only for internal use
  private
    # def means I am defining a function. A function can also be called as a 'method' or an 'action'
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
