# frozen_string_literal: true

module Shipstation
  class Error < StandardError
    attr_accessor :status_code, :headers

    def initialize(message, status_code, headers = {})
      @headers = headers
      @status_code = status_code
      super(message)
    end
  end
end
