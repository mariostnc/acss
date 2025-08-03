class BiosController < ApplicationController
    before_action :authenticate_user!, except: [:show]

    def edit
        @bio = current_user.bio || current_user.build_bio
    end

    def update
        @bio = current_user.bio || current_user.build_bio
        if @bio.update(bio_params)
            redirect_to dashboard_path, notice: 'Bio was successfully updated.'
        else
            render :edit
        end
    end

    def show
        @bio = Bio.find_by(username: params[:username])
        if @bio.nil?
            render plain: "Bio not found", status: 404
        else
            render :show
        end
    end

    private

    def bio_params
        params.require(:bio).permit(:username, :bio, :github, :instagram, :discord)
    end
end    
