# frozen_string_literal: true

module Shipstation
  class Error < StandardError
    def initialize(message:, status_code:, headers: {})
      @headers = headers
      @status_code = status_code
      super(message)
    end
  end
end
