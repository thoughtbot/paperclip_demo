class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @friend = find_friend
  end

  def new
    @friend = Friend.new
  end

  def edit
    @friend = find_friend
  end

  def create
    @friend = Friend.new(params[:friend])

    if @friend.save
      redirect_to @friend, notice: 'Friend was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @friend = Friend.find(params[:id])

    if @friend.update_attributes(params[:friend])
      redirect_to @friend, notice: 'Friend was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @friend = find_friend
    @friend.destroy
    redirect_to friends_path
  end

  private

  def find_friend
    Friend.find(params[:id])
  end
end
