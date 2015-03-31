class BaseController < ApplicationController

    before_action :check_user
    # def initialize
    #     super
    #     if !session[:user_id].blank?
    #         @user_profile = User.find(session[:user_id])
    #     end
    # end

    def check_user
        if !session[:user_id].blank?
            @user_profile = User.find(session[:user_id])
        end
    end

end