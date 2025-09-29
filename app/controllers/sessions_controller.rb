class SessionsController < ApplicationController
   
    def create
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
            login!
            render json:{logged_in: true, user: @user}, status: : ok
        else
            render json: { 
                 errors: ['Invalid credentials. Please verify and try again or sign up.'] 
            }, status: :unauthorized
        end 
    end

    

    def is_logged_in?
        if logged_in? && current_user
            render json: {logged_in: true, user: current_user}
        else
            render json: {logged_in: false, message: 'Not logged in'}
        end
    end 

    def destroy 
        logout!
        render json: { message: 'Successfully logged out' }, status: :ok
    end 

    private

    def session_params
       params.require(:user).permit(:username, :email, :password)
    end 

end