module SampleApi
  class Catalog < Base

    #http://localhost:3001/api/public/categories/catalog1
    def getCategories(catalog_id)
      response = public_query({
        :endpoint => '/api/public/categories/catalog'+catalog_id.to_s,
        :method => :GET
      })
      response
    end
    
    #http://localhost:3001/api/public/products/category1
    def getProducts(category_id)
      response = public_query({
        :endpoint => '/api/public/products/category'+category_id.to_s,
        :method => :GET
      })
      response
    end
    
    #http://localhost:3001/api/public/products-featured
    def getFeaturedProducts
      response = public_query({
        :endpoint => '/api/public/products-featured',
        :method => :GET
      })
      response
    end
    
    #http://localhost:3001/api/public/products/:id
    def getAProduct(product_id)
      response = public_query({
        :endpoint => '/api/public/products/'+product_id.to_s,
        :method => :GET
      })
      response
    end
  end
end
