# frozen_string_literal: true

module Shipstation
  class Client
    BASE_URL = "https://ssapi.shipstation.com"

    attr_reader :api_key, :api_secret, :adapter

    def initialize(api_key:, api_secret:, adapter: Faraday.default_adapter, stubs: nil)
      @api_key = api_key
      @api_secret = api_secret
      @adapter = adapter
      @stubs = stubs
    end

    def account
      AccountResource.new(self)
    end

    def carrier
      CarrierResource.new(self)
    end

    def order
      OrderResource.new(self)
    end

    def product
      ProductResource.new(self)
    end

    def shipment
      ShipmentResource.new(self)
    end

    def store
      StoreResource.new(self)
    end

    def webhook
      WebhookResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :Basic, Base64.strict_encode64("#{api_key}:#{api_secret}")
        conn.request :json

        conn.response :dates
        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end
  end
end