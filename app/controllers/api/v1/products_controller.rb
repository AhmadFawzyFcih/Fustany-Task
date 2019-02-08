class Api::V1::ProductsController < Api::V1::BaseController
#============================================================= 
    def create 
        @product = Product.new(product_params)
        if @product.save
            render json: @product , root: "product" , status: :created , 
            meta: {
              status: true
            } 
        else
            render json:{data: @product.errors , meta: {status: false} }  , status: :unprocessable_entity
        end
    end
#=============================================================
    def favorite #add and remove products to/from your favorite list
        product_id = params[:product_id]
        user_id    = params[:user_id]
        is_fav     = FavoriteProduct.where(:product_id => product_id , :user_id => user_id).first
        if is_fav #unfavorite product
          is_fav.destroy
          render json: {data: "product removed from your favorite list successfully" , meta: {status: true}} , status: :success 
        else #favorite product
          @make_fav = FavoriteProduct.new(favorite_params)
          if @make_fav.save
            render json: {data: "product added to your favorite  list successfully" , meta: {status: true}} , status: :created 
          else
            render json:{data: @make_fav.errors , meta: {status: false} }  , status: :unprocessable_entity
          end
        end   
    end
#=============================================================
    private

    def product_params
      params.permit(:user_id, :category_id, :name, :description, :image)
    end
    
    def favorite_params
        params.permit(:user_id, :product_id)
    end
#=============================================================
end
