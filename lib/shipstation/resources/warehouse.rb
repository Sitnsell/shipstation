# frozen_string_literal: true

module Shipstation
  class WarehouseResource < Resource
    def list(**params)
      response = get_request("warehouses", params: params).body
      response.map{ |warehouse| Warehouse.new(warehouse) }
    end

    def create(**attributes)
      Warehouse.new post_request("warehouses/createwarehouse", body: attributes).body
    end

    def update(warehouse_id:, **attributes)
      Warehouse.new post_request("warehouses/#{warehouse_id}", body: attributes).body
    end

    def unsubscribe(warehouse_id)
      Success.new delete_request("warehouses/#{warehouse_id}").body
    end
  end
end
