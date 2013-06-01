class TodosController < ApplicationController
  
  before_filter :authenticate_user, :except => [:home,:signup,:login_create]
  
  def home
  end
  
  
  def signup
        
  end
  
  def login_create
    Login.create(:name => params[:name],:email => params[:email],:password => params[:password],:record_del_flag=>'FALSE')
    redirect_to :action => 'home'
  end

  
  def index
    @todo_items = Todo.where(:record_del_flag=>'FALSE',:user=>session[:user_id])
    @todo_group = @todo_items.group_by { |t| t.created_at.beginning_of_day }
  end
  
  def add
    Todo.create(:todo_text => params[:todo_text], :record_del_flag=>'FALSE',:complete => 'FALSE',:user => session[:user_id])
    redirect_to :action => 'index'
  end
  
  def complete
    if !(params[:todos_checkbox]).nil?
      params[:todos_checkbox].each do |check|
        todo_id = check
        t = Todo.find_by_id(todo_id)
        t.update_attribute(:complete,'TRUE')
      end
    end
    redirect_to :action => 'index'
  end
  
  
  def all_todo
    @todo_items = Todo.where(:record_del_flag=>'FALSE')
    @todo_group = @todo_items.group_by { |t| t.created_at.beginning_of_day }
    @users=Login.select("id,name").where(:record_del_flag=>'FALSE')
  end
  
  def delete

      @todo_delete=Todo.find(params[:id])
      @todo_delete.record_del_flag="TRUE"
    
      if @todo_delete.save
        redirect_to :action => 'index'
      end

  end
  

  def authenticate_user
    
  	unless session[:user_id]
  		redirect_to(:controller => 'todos', :action => 'home')
  		return false
  	end
  end
  
end
