class SessionsController < ApplicationController
    def new
        
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:passsword])
        login!(@user)
        redirect_to user_url(@user.id)
    end

    def destroy
        
    end
end
