class ReviewsController < ApplicationController

    before_action :check_login, except: [:index, :show]

    def index
        #This is our list page for our reviews
        @price = params[:price]
        @cuisine = params[:cuisine]
        @location = params[:location]
        
        #start with all reviews
        @reviews = Review.all

        #filter by price
        if @price.present?
            @reviews = @reviews.where(price: @price)
        end

        #filter by cuisine
        if @cuisine.present?
            @reviews = @reviews.where(cuisine: @cuisine)
        end

        #search near the location
        if @location.present?
            @reviews = @reviews.near(@location)
        end

    end

    def new
        #form for adding a new review
        @review = Review.new
    end

    def create
        #take the information from the form and add it to the model
        @review = Review.new(form_params)

        #associate the above with a user
        @review.user = @current_user

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

        #delete if they have access 
        if @review.user == @current_user
            @review.destroy
        end

        #redirect to homepage
        redirect_to root_path
    
    end

    def edit
        #find individual review
        @review = Review.find(params[:id])

        if @review.user != @current_user
            redirect_to root_path
        end
    
    end

    def update
        #find individual review
        @review = Review.find(params[:id])

        if @review.user != @current_user
            redirect_to root_path
        else
            #update the review
            if @review.update(form_params)

                #redirect somewhere
                redirect_to review_path(@review)
            else
                render "edit"
            end
        end 
    end

    def form_params
        
        params.require(:review).permit(:title, :body, :score, :restaurant, :price, :cuisine, :ambiance, :address)
        
    end


end
