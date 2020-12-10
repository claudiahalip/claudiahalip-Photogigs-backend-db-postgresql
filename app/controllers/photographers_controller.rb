class PhotographersController <ApplicationController 
   
    def index
        photographers = Photographers.all 
        render json: photographers
    end

    def show
        photographer = Photographers.find(params[:id])
        if @photographer
            render json: photographer
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
        params.require(:photographer).permit(:name, :website, :years_of_experience, :city, :state, :image, :user_id)
    end



end