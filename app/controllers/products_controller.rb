class ProductsController < ApplicationController
# ==============================================
  layout 'fustany'
  before_action :authenticate_user!
  before_action :set_categories , only: [:index , :new]
# ==============================================
  def index
    if(params[:category_id] != nil) #filter by category id
      @products = Product.paginate(:page => params[:page], :per_page => 3).where(:category_id => params[:category_id]).orderByCreatedAt
    elsif(params[:my_fav] != nil) #get my favorite products
      product_ids = current_user.favorite_products.pluck(:product_id)
      @products   = Product.paginate(:page => params[:page], :per_page => 3).where(:id => product_ids).orderByCreatedAt
      @my_fav     = params[:my_fav] 
    else #get all products
      @products = Product.paginate(:page => params[:page], :per_page => 3).orderByCreatedAt
    end
  end
# ==============================================
  def new
    @product = Product.new
  end
# ==============================================
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to(products_path)
    else
      render('new')
    end
  end
# ==============================================
  def favorite
    product_id = params[:id]
    is_fav = FavoriteProduct.where(:product_id => product_id , :user_id => current_user.id).first
    if is_fav #unfavorite product
      is_fav.destroy
    else #favorite product
      @make_fav = FavoriteProduct.new()
      @make_fav.user_id = current_user.id
      @make_fav.product_id = product_id
      @make_fav.save
    end   
    redirect_to(products_path) 
  end
# ==============================================
  private
    def set_categories
      @categories = Category.all
    end

    def product_params
      params.require(:product).permit(:user_id, :category_id, :name, :description, :image).merge(user_id: current_user.id)
    end
# ==============================================
end
