class SessionsController < ApplicationController

def new
    #login form

end

def create
    #create session or login
    @form_data = params.require(:session)

    #retrieve username and password from the form
    @username = @form_data[:username]
    @password = @form_data[:password]

    #check the user is who they say they are
    @user = User.find_by(username: @username).try(:authenticate, @password)

    #if the user is athenticated, send them to the homepage

    if @user
        
        session[:user_id] = @user.id
        
        redirect_to root_path
    else
        render "new"
    end


end

def destroy
    #log out
    reset_session

    redirect_to new_session_path

end

end
