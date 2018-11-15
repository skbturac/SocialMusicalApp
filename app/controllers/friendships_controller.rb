class FriendshipsController < ApplicationController
  protect_from_forgery with: :exception

  def create
    #is this bulk addition or individual addition?
    if params.include?(:friend_id) #individual e.g. "Add friend" link
      @new_friendships = Friendship.create_reciprocal_for_ids(current_user_id, params[:friend_id])
    else #bulk e.g. checkboxes..."Add friends"
      params[:user][:friend_ids].each do |f_id|
      @new_friendships = Friendship.create_reciprocal_for_ids(current_user_id, f_id)
      end
    end
    redirect_to users_path
  end


  def destroy
    Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
    redirect_to(request.referer)
  end
end
