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
        #take the information from the form and add it to the model
        @review = Review.new(form_params)

        #check if the model can be saved
        #if it can be saved, go to the homepage
        #if not, show the new form

        if @review.save 
            redirect_to root_path
        else
            #show the view for new.html.erb
            render "new"
        end

        
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
        if @review.update(form_params)

            #redirect somewhere
            redirect_to review_path(@review)
        else
            render "edit"
    end

    def form_params
        
        params.require(:review).permit(:title, :body, :score, :restaurant, :price, :cuisine)
        
    end


end
