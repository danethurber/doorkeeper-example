class API::V1::UsersController < API::BaseController
  doorkeeper_for :all

  def index
    respond_with User.all, each_serializer: ::API::V1::UserSerializer
  end

  def show
    respond_with User.find(params[:id]), serializer: ::API::V1::UserSerializer
  end

end
