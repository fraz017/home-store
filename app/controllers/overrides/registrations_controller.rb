module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    def render_create_success
      # @resource will have been set by set_user_by_token concern
      if @resource
        render json: {
          success: true,
          data: {
            @resource 
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
            @resource 
          }
        }
      end
    end
  end
end