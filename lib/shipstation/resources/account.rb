# frozen_string_literal: true

module Shipstation
  class AccountResource < Resource
    def list_tags(**params)
      response = get_request("accounts/listtags", params: params).body
      response.map{ |tag| Tag.new(tag) }
    end

    def register(**attributes)
      Success.new get_request("accounts/registeraccount", body: attributes).body
    end
  end
end
