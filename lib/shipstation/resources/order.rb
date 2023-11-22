# frozen_string_literal: true

module Shipstation
  class OrderResource < Resource
    def list(**params)
      response = get_request("orders", params: params)
      Collection.from_response(response, key: "orders", type: Order)
    end

    def list_by_tag(**params)
      response = get_request("orders/listbytag", params: params)
      Collection.from_response(response, key: "orders", type: Order)
    end

    def add_tag(**attributes)
      Success.new post_request("orders/addtag", body: attributes).body
    end

    def assign_user(**attributes)
      Success.new post_request("orders/assignuser", body: attributes).body
    end

    def create_label(**attributes)
      Label.new post_request("orders/createlabelfororder", body: attributes).body
    end

    def create(**attributes)
      Order.new post_request("orders/createorder", body: attributes).body
    end

    def delete(order_id:)
      Success.new get_request("orders/#{order_id}").body
    end

    def retrieve(order_id:)
      Order.new get_request("orders/#{order_id}").body
    end

    def hold(**attributes)
      Success.new post_request("orders/holduntil", body: attributes).body
    end

    def mark_shipped(**attributes)
      Success.new post_request("orders/markasshipped", body: attributes).body
    end

    def remove_tag(**attributes)
      Success.new post_request("orders/removetag", body: attributes).body
    end

    def unhold(**attributes)
      Success.new post_request("orders/restorefromhold", body: attributes).body
    end

    def unassign_user(**attributes)
      Success.new post_request("orders/unassignuser", body: attributes).body
    end
  end
end