class IndexController < BaseController

    def index
        @entries = @user_profile.entries
    end

end
