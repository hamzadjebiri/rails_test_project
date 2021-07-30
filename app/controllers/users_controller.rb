class UsersController < ApplicationController

    before_action :set_user , only: [:show, :edit,:update]

    def index
        @users = User.paginate(page: params[:page], per_page: 2)
    end
    
    def show
        @user_articles = @user.articles.paginate(page: params[:page], per_page: 2)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
            redirect_to articles_path
        else
            render 'new'
        end

        #@user = User.new(user_params)
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "You have successfully updated your account"
            redirect_to @user
        else
            render 'edit'
        end

    end
    

    private

    def user_params
        params.require(:user).permit(:username,:email,:password)        
    end

    def set_user
        @user = User.find(params[:id])
    end

end
