# frozen_string_literal: true

module Shipstation
  class Resource
    attr_reader :client

    ERROR_MESSAGES = {
      "400": "Your request was malformed.",
      "401": "You did not supply valid authentication credentials.",
      "403": "You are not allowed to perform that action.",
      "404": "No results were found for your request.",
      "429": "Your request exceeded the API rate limit.",
      "500": "We were unable to perform the request due to server-side problems.",
      "503": "You have been rate limited for sending more than 40 requests per minute."
    }.freeze

    def initialize(client)
      @client = client
    end

    private

    def get_request(url, params: {}, headers: {})
      handle_response client.connection.get(url, params, headers)
    end

    def post_request(url, body:, headers: {})
      handle_response client.connection.post(url, body, headers)
    end

    def patch_request(url, body:, headers: {})
      handle_response client.connection.patch(url, body, headers)
    end

    def put_request(url, body:, headers: {})
      handle_response client.connection.put(url, body, headers)
    end

    def delete_request(url, params: {}, headers: {})
      handle_response client.connection.delete(url, params, headers)
    end

    def handle_response(response)
      Rails.logger.info response.inspect
      raise Error.new(ERROR_MESSAGES[response.status.to_s], response.status, response.headers) if response.status >= 400

      response
    end
  end
end