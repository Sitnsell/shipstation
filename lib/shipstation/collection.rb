# frozen_string_literal: true

module Shipstation
  class Collection
    attr_reader :data, :total, :page, :pages

    def self.from_response(response, key:, type:)
      body = response.body
      new(
        data: body[key].map { |attrs| type.new(attrs) },
        total: body["total"],
        page: body["page"],
        pages: body["pages"]
      )
    end

    def initialize(data:, total:, pages:, page:)
      @data = data
      @total = total
      @pages = pages
      @page = page
    end
  end
end
