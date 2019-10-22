class SessionsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create, :destroy]

    def new
    end

    def create
        # byebug
        if !params[:name]
            redirect_to login_path
        elsif params[:name].empty?
            redirect_to login_path
        else
            current_user = params[:name]
            session[:name] = current_user
        end
    end

    def destroy
        if session[:name]
            session[:name] = nil
        end
    end

    private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end