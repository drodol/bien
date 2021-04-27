class CommentsController < ApplicationController

    def create
    
        #find the review
        @review = Review.find(params[:review_id])

        #make a new comment for that review
        @comment = @review.comments.new(params.require(:comment).permit(:body))

        @comment.save

        #go back to the review show page
        redirect_to review_path(@review)
    
    end


end
