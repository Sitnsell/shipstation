# frozen_string_literal: true

module Shipstation
  class ProductResource < Resource
    def list(**params)
      response = get_request("products", params: params)
      Collection.from_response(response, key: "products", type: Product)
    end

    def retrieve(product_id:)
      Product.new get_request("products/#{product_id}").body
    end

    def update(product_id:, **attributes)
      Success.new post_request("products/#{product_id}", body: attributes).body
    end
  end
end
