class UsersController < ApplicationController

  def index
    render json: { data: User.all }
  end

end