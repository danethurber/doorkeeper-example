class API::V1::UserSerializer < API::BaseSerializer
  attributes :id, :name, :email, :href

  def name
    "#{object.first_name} #{object.last_name}"
  end

  def href
    api_v1_user_url object
  end
end
