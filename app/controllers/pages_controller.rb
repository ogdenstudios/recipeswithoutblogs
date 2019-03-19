class PagesController < ApplicationController
    def about
        @description = "Recipes Without Blogs - About the project."
    end

    def privacy_policy 
        @description = "Recipes Without Blogs - Privacy policy"
    end
end