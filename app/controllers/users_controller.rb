class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_only, only: [:destroy]

  def new
   @us_new = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
   @useer = User.find(params[:id])
  end

  def create
   @us_new = User.new(user_params)
    if @us_new.save
     flash[:success] = "New user successfull create"
     logg_in(@us_new)
     redirect_to @us_new
    else
     render "new"
    end
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully update"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end


    private
    def user_params
      params.require(:user).permit(:name, :nick, :password, :password_confirmation)
    end

    # Предварительные фильтры
        # Подтверждает вход пользователя.
    def logged_in_user
        if  !logged_in?
          flash[:danger] = "Please log in"
          redirect_to login_path
        end
    end
        # Подтверждает права пользователя.
    def correct_user
      arbuser = User.find(params[:id])
      if !current_user?(arbuser)
        flash[:danger] = "Wrong user!!!"
        redirect_to root_path
      end
    end

     # Подтверждает наличие административных привилегий
    def admin_only
      redirect_to root_path unless current_user.admin?
    end

end
