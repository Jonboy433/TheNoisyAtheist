class UsersController < ApplicationController

    #Display user profile with all relevant data
    def show
        find_user
        render 'show'
    end

    def update
    end

    private
    def find_user
        @user = User.find_by_user_id(params[:id])
    end
end
