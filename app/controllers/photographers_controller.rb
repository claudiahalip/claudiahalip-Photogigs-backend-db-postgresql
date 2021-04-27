class PhotographersController <ApplicationController 
   
    def index
        photographers = Photographer.all.with_attached_featured_image 
        render json: photographers.map { |photographer|
        photographer.as_json.merge({image: url_for(photographer.avatar)})
        }

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

    private

    def photographer_params
        params.require(:photographer).permit(:name, :website, :years_of_experience, :city, :state, :image)
    end



end