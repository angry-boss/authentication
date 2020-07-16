module Authentication
  class Engine < ::Rails::Engine

    engine_name 'authentication'

    initializer 'authentication.initialize' do |app|
      ActiveSupport.on_load :active_record do
        require 'authentication/session'
      end

      ActiveSupport.on_load :action_controller do
        require 'authentication/controller_extension'
        include Authentication::ControllerExtension
      end
    end
  end
end
