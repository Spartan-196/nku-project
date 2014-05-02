class UsersController < ApplicationController

  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save #Save input to new user
      session[:user_id] = @user.id	  #generate session ID
      redirect_to root_path, :notice => "You have registered." #route user back to users with a "sucessful" notification
    else
      flash[:notice] = "Invalid input please correct"
      render 'new' #Show form for them to correct invalid entrie
    end
   end

  def upload
    UserUploader.new(params[:file])
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    @current = get_current_user
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User updated"
       redirect_to root_path
    else
      render 'edit'
    end
  end

  def index
    @date = params[:date] || Date.today
    @user = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice]="Delete Successful"
    session[:user_id] = nil
    @current_user=nil
      redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name,:email, :password, :password_confirmation, :image)
    end
  end


