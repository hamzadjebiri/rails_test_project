class ApplicationController < ActionController::Base

    # this made some methods available as helper methods so we can use its too in our views and helpers folder
    # so we can call current_user from this "controller" by any methods in "helper/" folder
    helper_method :current_user , :logged_in? , :require_user

    # ||= if we have already @current_user then return it else get it by execting the next code
    # wich is : ' User.find(session[:user_id]) if session[:user_id]'
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    # turn @current_user in to a boolean by using "!!"
    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in To perform that action"
            redirect_to login_path
        end
    end 

end
