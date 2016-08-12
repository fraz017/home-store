module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    def render_create_success
      # @resource will have been set by set_user_by_token concern
      if @resource
        render json: {
          success: true,
          data: {
            email: @resource.email,
            first_name: @resource.first_name,
            last_name: @resource.last_name,
            image: @resource.image.url 
          }
        }
      end
    end

    def render_update_success
      # @resource will have been set by set_user_by_token concern
      if @resource
        render json: {
          success: true,
          data: {
            email: @resource.email,
            first_name: @resource.first_name,
            last_name: @resource.last_name,
            image: @resource.image.url 
          }
        }
      end
    end
  end
end