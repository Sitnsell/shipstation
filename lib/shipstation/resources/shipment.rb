# frozen_string_literal: true

module Shipstation
  class ShipmentResource < Resource
    def list(**params)
      response = get_request("shipments", params: params)
      Collection.from_response(response, key: "shipments", type: Shipment)
    end

    def get_rates(**attributes)
      response = post_request("shipments/getrates", body: attributes).body
      response.map{ |rate| Rate.new(rate) }
    end

    def create_label(**attributes)
      Success.new post_request("shipments/createlabel", body: attributes).body
    end

    def void_label(**attributes)
      Success.new post_request("shipments/voidlabel", body: attributes).body
    end
  end
end
