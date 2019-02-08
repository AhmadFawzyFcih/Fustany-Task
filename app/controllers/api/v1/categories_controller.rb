class Api::V1::CategoriesController < Api::V1::BaseController
    
    def create
        @category = Category.new(category_params)
        if @category.save
            render json: @category , root: "category"  , status: :created , 
            meta: {
              status: true
            } 
        else
            render json:{data: @category.errors , meta: {status: false} }  , status: :unprocessable_entity
        end
    end

    private 
    def category_params
        params.permit(:name)
    end
end
