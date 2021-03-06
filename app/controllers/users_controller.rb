class UsersController < ApplicationController
    before_action :set_user, only: [:new, :show, :edit, :update]

    def new
        @user = User.new
    end

    def edit
       set_user
    end

    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end

    def index
        @users = User.all
    end

    def update
        set_user

       if @user.update(user_params)
            flash[:notice] = "Your account was successfully updated!"

            redirect_to @user
       else
            render 'edit'
       end
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome #{@user.username}, you have successfully signed up!"

            redirect_to articles_path
        else
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
