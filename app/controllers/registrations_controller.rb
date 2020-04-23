# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, :redirect_unless_admin, only: [:new, :create]
  skip_before_action :require_no_authentication

  def create
    super do
      if current_user.try(:admin)
        if not ["district_admin", "panchayat_admin", "phone_caller"].include?(resource.role)
          resource.role = "phone_caller"
          resource.save
        end
      elsif current_user.try(:district_admin)
        if not ["panchayat_admin", "phone_caller"].include?(resource.role)
          resource.role = "phone_caller"
          resource.save
        end
      end
    end
  end

  private

  def redirect_unless_admin
    unless current_user.try(:admin?) || current_user.try(:district_admin?)
      flash[:alert] = "Access Denied! Only Admins are Allowed Access"
      redirect_to root_path
    end
  end

  def sign_up(resource_name, resource)
    true
  end

  def after_sign_up_path_for(resource)
    root_path
  end
end
