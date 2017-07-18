class HomeController < ApplicationController
  def index
  end

  def register
    user = User.new
    render :register, locals: {user: user}
  end

  def register_form
    user = User.new(register_params)
    if user.save!
      redirect_to '/login'
    else
      render :register,locals: {user:user}
    end
  end

  def login
  end

  def logout
    session.clear
    redirect_to '/'
  end

  def login_form
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to '/review'
    else
      render :login
    end
  end

  private 
  def register_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end