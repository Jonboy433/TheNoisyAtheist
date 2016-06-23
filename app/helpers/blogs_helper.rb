module BlogsHelper

    def edit_blog_url(displayID)
        sprintf("/blogs/%s/edit",displayID)
    end

    def user_profile_url(userID)
        sprintf("/users/%s",userID)
    end
end
