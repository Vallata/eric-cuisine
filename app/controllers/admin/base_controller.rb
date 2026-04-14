class Admin::BaseController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    redirect_to new_admin_session_path unless admin_logged_in?
  end
end
