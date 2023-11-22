# frozen_string_literal: true

module Shipstation
  class CarrierResource < Resource
    def list(**params)
      response = get_request("carriers", params: params).body
      response.map{ |carrier| Carrier.new(carrier) }
    end

    def list_packages(**params)
      response = get_request("carriers/listpackages", params: params).body
      response.map{ |package| Package.new(package) }
    end

    def list_services(**params)
      response = get_request("carriers/listservices", params: params).body
      response.map{ |package| Package.new(package) }
    end

    def retrieve(**params)
      Carrier.new get_request("carriers/getcarrier", params: params).body
    end

    def register(**attributes)
      Success.new get_request("accounts/registeraccount", body: attributes).body
    end
  end
end
