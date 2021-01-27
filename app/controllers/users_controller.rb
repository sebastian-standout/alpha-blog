class UsersController < ApplicationController
    before_action :find_user

    def new
        @user = User.new
    end

    def edit
       find_user
    end

    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end

    def update
        find_user

       if @user.update(user_params)
            flash[:notice] = "Your account was successfully updated!"

            redirect_to articles_path
       else
            render 'edit'
       end
    end

    def create
        @user = User.new(user_params)

        if @user.save
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

    def find_user
        @user = User.find(params[:id])
    end
end
