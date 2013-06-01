class SessionController < ApplicationController
  def new
  end

  def create
    
    user = Login.find_by_name_and_password_and_record_del_flag(params[:user], params[:password],'FALSE')
    puts(user)
     if user
       session[:user_id] = user.id
       redirect_to todos_index_path, :notice => "Logged in!"
     else
       flash.now.alert = "Invalid email or password"
       redirect_to session_new_path
     end
     
  end

  def destroy
    session[:user_id] = nil
    redirect_to todos_home_path, :notice => "Logged out!"
  end
end
