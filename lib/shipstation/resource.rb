# frozen_string_literal: true

module Shipstation
  class Resource
    attr_reader :client

    ERROR_MESSAGES = {
      400: "",
    }

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
      case response.status
      when 400
        raise Error, "Your request was malformed.", 400, response.headers
      when 401
        raise Error, "You did not supply valid authentication credentials.", 401, response.headers
      when 403
        raise Error, "You are not allowed to perform that action.", 403, response.headers
      when 404
        raise Error, "No results were found for your request.", 404, response.headers
      when 429
        raise Error, "Your request exceeded the API rate limit.", 429, response.headers
      when 500
        raise Error, "We were unable to perform the request due to server-side problems.", 500, response.headers
      when 503
        raise Error, "You have been rate limited for sending more than 40 requests per minute.", 503, response.headers
      end

      response.body.deep_symbolize_keys!
      response
    end
  end
end