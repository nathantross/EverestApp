class UsersController < ApplicationController
   def index
     @users = User.all
   end
 
   def show
     @user = User.find(params[:id])
     @fitgem_info = current_user.fitbit_data
    end
end
