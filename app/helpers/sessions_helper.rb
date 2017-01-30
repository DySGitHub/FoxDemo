 module SessionsHelper

      def logged_in_user
        unless logged_in?
          flash[:notice] = "Please log in"
          redirect_to login_url
        end
    end 
end 