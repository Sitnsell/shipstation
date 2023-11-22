# frozen_string_literal: true

module Shipstation
  class WebhookResource < Resource
    def list(**params)
      response = get_request("webhooks", params: params)
      Collection.from_response(response, key: "webhooks", type: Webhook)
    end

    def subscribe(**attributes)
      Webhook.new post_request("webhooks/subscribe", body: attributes).body
    end

    def unsubscribe(webhook_id)
      delete_request "webhooks/#{webhook_id}"
    end
  end
end
