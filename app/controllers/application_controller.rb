class ApplicationController < ActionController::Base
 
  helper_method :current_user

  helper_method :set_user 

  def set_user 
    @user = User.find(params[:user_id])
  end
  

  def current_user

    if session[:user_id]
      User.find session[:user_id]
    end
  end

  def authenticate 
    if !current_user
      redirect_to signup_path, alert: "Invalid request"
    end
  end

  private
   
  def login(user)
      session[:user_id] = user.id
    end

    def logout
      session[:user_id] = nil
    end 
end
