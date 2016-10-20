class UsersController < ApplicationController

  def index
  	@users=User.all
  end

  def show_new_user_form
    render "new"
  end
  
  def enter_user_info
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
     if @user.valid?
      @user.save
      redirect_to "/"
     else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
     end
  end

  def show
    @user = User.find(params[:id])
  end 


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
      if @user.update_attributes(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
      redirect_to "/"
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end

  end

  def destroy
    @user = User.destroy(params[:id])
    redirect_to "/"

  end




end
