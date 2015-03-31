class EntriesController < BaseController

    def index
        @entries = @user_profile.entries
    end

    def create
        @entry = Entry.new(entry_params)
        if @entry.save
            flash[:message] = 'Entry was created successfully...'
            redirect_to entries_path
        else
            render 'new'
        end
    end

    def new
        @entry = Entry.new
    end

    def edit
        if !params[:id].blank?
            @entry = Entry.find(params[:id])
        else
            redirect_to entries_path
        end
    end

    def show
        @entry = Entry.find(params[:id])
    end

    def update
        if !params[:id].blank?
            @entry = Entry.find(params[:id])
            if !@entry.update(entry_params)
                render 'edit'
            end
        end
        redirect_to entries_path
    end

    def destroy
        if !params[:id].blank?
            @entry = Entry.find(params[:id])
            if @entry.destroy
                flash[:message] = 'Entry was deleted successfully...'
            else
                flash[:message] = 'Entry was deleted failure...'
            end
        end
        redirect_to entries_path
    end

    private
        def entry_params
            params.require(:entry).permit(:title, :body, :user_id)
        end

end
