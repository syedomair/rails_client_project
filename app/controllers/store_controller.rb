class StoreController < ApplicationController
  def home
    rtnResponse = SampleApi::Catalog.new.getCategories(1)
    if rtnResponse[:status] == 'success'
      @categories = rtnResponse[:data]
    end

    rtnResponse = SampleApi::Catalog.new.getFeaturedProducts()
    if rtnResponse[:status] == 'success'
      @products = rtnResponse[:data]
    end
  end

  def products_category
    rtnResponse = SampleApi::Catalog.new.getCategories(1)
    if rtnResponse[:status] == 'success'
      @categories = rtnResponse[:data]
    end
    rtnResponse = SampleApi::Catalog.new.getProducts(params[:id])
    if rtnResponse[:status] == 'success'
      @products = rtnResponse[:data]
    end
  end

  def product_detail
    rtnResponse = SampleApi::Catalog.new.getCategories(1)
    if rtnResponse[:status] == 'success'
      @categories = rtnResponse[:data]
    end
    rtnResponse = SampleApi::Catalog.new.getAProduct(params[:id])
    if rtnResponse[:status] == 'success'
      @product = rtnResponse[:data]
    end
  end
end
