class SessionsController < ApplicationController
  attr_writer :current_user
  
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user.nil?
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'Леее куда прешь с неправильным паролем или логином' }
      end
    else
      sign_in user
      redirect_to :calc_input
    end
  end

  def exit
    sign_out
    redirect_to :root
  end

  def sign_in(user)
    session[:current_user_id] = user.id
    self.current_user = user
  end

  def sign_out
    session[:current_user_id] = nil
    self.current_user = nil
  end
end
