class UsersController < ApplicationController
    before_action :authenticate, except: [:new, :create]
  
    def new
      @user = User.new
    end
  
    def create 
      @user = User.new user_params
      if @user.save
        login(@user)
        redirect_to root_path, notice: "You have successfully signed up."
      else
        render :new, status: :unprocessable_entity
      end
     end

    def show 
      @user = current_user
    end
  
     private
  
     def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email)
     end
  
  end