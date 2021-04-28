class PhotographersController <ApplicationController 
   
    def index
        photographers = Photographer.all.with_attached_avatar
        render json: photographers.map { |photographer|
            if photographer.avatar.attached?
                photographer.as_json.merge({image: url_for(photographer.avatar)}) 
            else
                photographer
            end
        }
    end

    def show
        photographer = Photographer.find(params[:id])
        avatar= rails_blob_path(photographer.avatar)
        url = url_for(photographer.avatar) 
        if @photographer
            render json: { photographer: photographer, image: avatar, url: url}
        else
            render json: "no photographer found"
        end
    end 

    def create 
        photographer = Photographer.new(photographer_params)
        if photographer.save
            render json: photographer
        else
            render json: {error: "Your list couldn't be added!Please try again"}
        end
    end

    def update
        photographer = Photographer.find(params[:id])
        photographer.update(avatar: params[:avatar])
        avatar_url = rails_blob_path(photographer.avatar)
        render json: {photographer: photographer, image: avatar_url}
    end

    private

    def photographer_params
        params.require(:photographer).permit(:name, :website, :years_of_experience, :city, :state, :image)
    end
end