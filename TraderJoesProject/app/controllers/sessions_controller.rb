class SessionsController < ApplicationController

    def welcome

    end

    def destroy
        session[:user_id] = nil
        redirect_to welcome_path
    end

    def new
        
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Sorry, login info was incorrect. Please try again."
            redirect_to login_path
        end
    end
        





end