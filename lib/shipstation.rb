# frozen_string_literal: true

require "base64"
require "faraday"
require "faraday_middleware"
require_relative "shipstation/version"

module Shipstation
  autoload :Client, "shipstation/client"
  autoload :Collection, "shipstation/collection"
  autoload :Error, "shipstation/error"
  autoload :Resource, "shipstation/resource"
  autoload :Object, "shipstation/object"

  autoload :AccountResource, "shipstation/resources/account"
  autoload :CarrierResource, "shipstation/resources/carrier"
  autoload :OrderResource, "shipstation/resources/order"
  autoload :ProductResource, "shipstation/resources/product"
  autoload :ShipmentResource, "shipstation/resources/shipment"
  autoload :StoreResource, "shipstation/resources/store"
  autoload :WebhookResource, "shipstation/resources/webhook"

  autoload :Account, "shipstation/objects/account"
  autoload :Carrier, "shipstation/objects/carrier"
  autoload :Label, "shipstation/objects/label"
  autoload :Marketplace, "shipstation/objects/marketplace"
  autoload :Order, "shipstation/objects/order"
  autoload :Package, "shipstation/objects/package"
  autoload :Product, "shipstation/objects/product"
  autoload :Rate, "shipstation/objects/rate"
  autoload :Service, "shipstation/objects/service"
  autoload :Shipment, "shipstation/objects/shipment"
  autoload :Store, "shipstation/objects/store"
  autoload :Success, "shipstation/objects/success"
  autoload :Tag, "shipstation/objects/tag"
  autoload :Webhook, "shipstation/objects/webhook"

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :redis_instance
  end
end
