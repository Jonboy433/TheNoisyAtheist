class CustomFailure < Devise::FailureApp

    def respond
        if request.format == 'application/json'
            json_failure
        else
            super
        end
    end

     def json_failure
        self.status = 401
        self.content_type = 'application/json'
        self.response_body = {"success"=> false, "errors" => ["Invalid credentials"]}.to_json
    end

end