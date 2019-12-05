class ApplicationController < ActionController::Base
    def login!(user)
        #generate a new session token each time user logs in
        user.reset_session_token
        #ensure browser's session token matches the user's
        session[:session_token] = user.session_token
        current_user
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end
end
