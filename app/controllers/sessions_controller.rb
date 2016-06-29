class SessionsController < Devise::SessionsController
    respond_to :json

    def new
        super
    end

    def create
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        yield resource if block_given?
       #No longer redirecting from the controller; app.js handles this function 
       respond_with resource, location: after_sign_in_path_for(resource)
    end

    protected
    def auth_options
        { scope: resource_name, recall: "blogs#index" }
    end
end