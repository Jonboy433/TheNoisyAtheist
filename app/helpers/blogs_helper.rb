module BlogsHelper

    def edit_blog_url(displayID)
        sprintf("/blogs/%s/edit",displayID)
    end
end
