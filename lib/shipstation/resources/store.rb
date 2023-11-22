# frozen_string_literal: true

module Shipstation
  class StoreResource < Resource
    def list(**params)
      response = get_request("stores", params: params).body
      response.map { |store| Store.new(store) }
    end

    def list_marketplaces
      response = get_request("stores/marketplaces").body
      response.map { |marketplace| Marketplace.new(marketplace) }
    end

    def list_services(**params)
      response = get_request("carriers/listservices", params: params).body
      response.map { |package| Package.new(package) }
    end

    def deactivate(**attributes)
      Success.new post_request("stores/deactivate", body: attributes).body
    end

    def refresh_rate(**params)
      Store.new get_request("stores/getrefreshstatus", params: params).body
    end

    def retrieve(store_id:)
      Store.new get_request("stores/#{store_id}").body
    end

    def reactivate(**attributes)
      Success.new post_request("stores/reactivate", body: attributes).body
    end

    def refresh(**attributes)
      Success.new post_request("stores/refreshstore", body: attributes).body
    end

    def update(store_id:, **attributes)
      Store.new put_request("stores/#{store_id}", body: attributes).body
    end
  end
end
