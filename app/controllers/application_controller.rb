# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :authenticate, except: %i[signup signin new create]
  before_action :set_locale

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def authenticate
    redirect_to signin_path unless current_user
  end
end
