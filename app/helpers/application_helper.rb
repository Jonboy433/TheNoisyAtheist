module ApplicationHelper

    def profile_url(user_id)
        #Populate UID into NavBar
        sprintf("/users/%s",user_id)
    end
end
