class UsersController < BaseController

    def index
        @users = User.all
    end

    def create
        # render plain: params[:users].inspect
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:error] = 'User was created failure...'
            render 'new'
        end
    end

    def new
        @user = User.new
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            flash[:message] = 'User was deleted successfully...'
        else
            flash[:message] = 'User was deleted failure...'
        end
        redirect_to users_path
    end

    private
        def user_params
            params.require(:user).permit(:email, :password)
        end

end
