class UsersController < ApplicationController
    def new
        render :new
    end

    def create
        #create attribute because we want to be able to manipulate in view
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        render :show
    end
    
    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
