class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_path(current_user.id)
    end
  end

  def create
    auth = request.env["omniauth.auth"]
    binding.pry

    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    if user == User.find_by_provider_and_uid(auth["provider"], auth["uid"])
      user.update(oauth_token: auth['credentials']['token'], oauth_secret: auth['credentials']['secret'])
    end
    session[:user_id] = user.id
    redirect_to user_path(current_user.id), :notice => "Welcome to Base Camp!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have left Base Camp!"
  end

end
