class SessionsController < ApplicationController

    def index

    end

    def create
        if params.has_key?(:users)
            @user_profile = User.find_by(email: params[:users][:email], password: params[:users][:password])
            if !@user_profile.blank?
                session[:user_id] = @user_profile.id
                redirect_to root_path
            else
                flash[:errorMessage] = 'Email or Password incorrect...'
                redirect_to sessions_path
            end
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

end
