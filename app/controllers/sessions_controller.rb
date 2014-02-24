class SessionsController < ApplicationController
  def new
  end

  def create
<<<<<<< HEAD
    auth_hash = request.env['omniauth.auth']

    render :text => auth_hash.inspect
 
    #@user = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||
    #User.create_with_omniauth(auth_hash)

    #session[:user_id] = @user.id 

    #redirect_to root_url, :notice => "Signed in!"
=======
    auth = request.env["omniauth.auth"]
    binding.pry
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
>>>>>>> 527298e70cfb9800eacf814d7e4c4ad572561f95
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

end
