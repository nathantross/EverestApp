class UsersController < ApplicationController
   def index
     @users = User.all
   end
 
   def show
     @user = User.find(params[:id])
     @fitgem_info = current_user.fitbit_data
     @distance = @fitgem_info.activity_statistics['lifetime']['tracker']['distance']
     @avatar = @fitgem_info.user_info['user']['avatar']
     @climb = @fitgem_info.activity_statistics['lifetime']['tracker']['floors'] * 10
    end
end
