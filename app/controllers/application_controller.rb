class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery

  def after_sign_in_path_for(resource)
    stored = stored_location_for(resource)
    return stored if stored

    root_url
  end
end
