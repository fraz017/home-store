module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    def render_create_success
      # @resource will have been set by set_user_by_token concern
      if @resource
        render json: {
          success: true,
          data: {
            email: @resource.email,
            name: @resource.name,
            nickname: @resource.nickname,
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
            name: @resource.name,
            nickname: @resource.nickname,
            image: @resource.image.url 
          }
        }
      end
    end
  end
end