class UsersController < ApplicationController

  def new
     if current_user
       redirect_to friends_path
     else
       @user = User.new
     end


   end

  def create
    @user = User.new(params[:user])
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user, notice: "Thank you for signing up for Meower"
      else
        render 'new'
      end
  end
    def index
      @users = User.all
      @meow = Meowe.new
    end

     def friends
       if current_user
        @meow = Meowe.new
        friends_ids = current_user.followeds.map(&:id).push(current_user.id)
        @meowes = Meowe.find_all_by_user_id  friends_ids
       else
         redirect_to root_url
       end
     end

  def show
    @user = User.find(params[:id])
    @meow = Meowe.new
    @relationship = Relationship.where(
        follower_id: current_user.id,
        followed_id: @user.id
    ).first_or_initialize if current_user

  end
  def edit
    @user = User.find(params[:id])
    redirect_to @user unless @user == current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user] )
      redirect_to @user, notice: "Profile updated!"
    else
      render  'edit'
    end

  end
end
