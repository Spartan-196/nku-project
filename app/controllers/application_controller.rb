class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    def get_current_user
    # Find whos logged in
    if( session[:user_id] == nil )
      return nil
    end
    return Student.find( session[:user_id] )
  end

  helper_method :get_current_user

  private
  def require_login
    if get_current_user == nil
      flash[:error] = "You must be logged in to access this section"
      redirect_to sessions_path # halts request cycle
    end
   end
  end
end
