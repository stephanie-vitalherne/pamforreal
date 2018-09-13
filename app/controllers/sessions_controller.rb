class SessionsController < ApplicationController
  def new
    @page_title = 'PS 118 Admin Panel'
  end

  def create
    user = Instructor.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to instructor_path(user) # usually redirect_to to the profile_path
    else
      msg = 'Invalid credentials'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    log_out if logged_in?
    p 'Logged out successfully'
    redirect_to root_path
  end
end
