class API::V1::UsersController < API::BaseController
  doorkeeper_for :all

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

end
