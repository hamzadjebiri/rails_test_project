class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(params.require(:user).permit(:username,:email,:password))

        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
            redirect_to articles_path
        else
            render 'new'
        end

        #@user = User.new(user_params)
    end
end
