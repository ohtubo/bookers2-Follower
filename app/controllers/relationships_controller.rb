class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow(params[:user_id])
    @user = User.find(params[:user_id])#非同期に変数がないため付け加え
    #なぜuser_idなのかcurrent_userはどのように渡している？
    #byebug
    # redirect_to request.referer
  end

  def destroy
    # byebug
    current_user.unfollow(params[:user_id])
    @user = User.find(params[:user_id])#非同期に変数がないため付け加え
    # byebug
    # redirect_to request.referer
  end
  # followings, followersは省略

  def followings
     user = User.find(params[:user_id])
     @users = user.followings
  end

  def followers
     user = User.find(params[:user_id])
     @users = user.followers
  end
end
