class UsersController < ApplicationController
  def new
   @us_new = User.new
  end

  def index
    @us_all = User.all
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

    private
    def user_params
      params.require(:user).permit(:name, :nick, :password, :password_confirmation)
    end

end




#redirect_to @us_new
