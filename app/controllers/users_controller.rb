class UsersController < ApplicationController

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
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "You have successfully updated your account"
            redirect_to articles_path
        else
            render 'edit'
        end

    end
    

    private

    def user_params
        params.require(:user).permit(:username,:email,:password)        
    end

end
