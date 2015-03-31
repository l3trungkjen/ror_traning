class IndexController < BaseController

    def index
        @entries = Entry.all
    end

end
