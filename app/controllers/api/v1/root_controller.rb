class API::V1::RootController < API::BaseController
  def index
    hash = {}

    if current_user
      hash.merge!({
        :account => {
          :href => api_v1_user_url(current_user)
        }
      })
    end

    respond_with hash.to_json
  end
end
