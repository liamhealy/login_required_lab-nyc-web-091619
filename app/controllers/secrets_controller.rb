class SecretsController < ApplicationController

    def show
        if !session[:name]
            redirect_to login_path
        end
    end

end