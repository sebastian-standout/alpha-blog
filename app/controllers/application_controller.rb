class ApplicationController < ActionController::Base
    # Methods in here will be available to all controllers

    # Makes methods defined in this file available to all views as a helper_method
    helper_method :current_user, :logged_in?

    def current_user
        # If we've called this method befor eand have a current user, return
        # @current_user, otherwise search for the user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        # !! turns current_user to a boolean, true or false
        !!current_user
    end
end
