class ReviewsController < ApplicationController

    def index
        #This is our list page for our reviews
        @reviews = Review.all
    end

    def new
        #form for adding a new review
        @review = Review.new
    end

    def create
        #take the information from the form and add it to the database
        @review = Review.new(form_params)

        #save this to the database
        @review.save

        #redirect to the home page
        redirect_to root_path
    end

    def show
        #individual review page

        @review = Review.find(params[:id])
    end

    def destroy
        #find individual review

        @review = Review.find(params[:id])

        #delete it
        @review.destroy

        #redirect to homepage
        redirect_to root_path
    
    end

    def edit
        #find individual review
        @review = Review.find(params[:id])
    
    end

    def update
        #find individual review
        @review = Review.find(params[:id])

        #update the review
        @review.update(form_params)

        #redirect somewhere
        redirect_to review_path(@review)
    end

    def form_params
        
        params.require(:review).permit(:title, :body, :score, :restaurant, :price, :cuisine)
        
    end


end
