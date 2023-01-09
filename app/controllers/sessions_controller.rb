class SessionsController < ApplicationController
  def new

  end

  def create
   user25 = User.find_by(nick: params[:session][:eemail].downcase)
    if user25 && user25.authenticate(params[:session][:ppassword])
     logg_in(user25)
     redirect_to user25
    else
    flash.now[:danger] = "Invalid email/password combination"
    render "new"
    end
  end

  def destroy
   log_out
   redirect_to root_path
  end

end
