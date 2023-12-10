module Shipstation
  class Object < OpenStruct
    def initialize(attributes)
      super to_ostruct(attributes)
    end

    def to_ostruct(obj)
      if obj.is_a?(Hash)
        OpenStruct.new(obj.map { |key, value| [key.to_snakecase, to_ostruct(value)]}.to_h)
      elsif obj.is_a?(Array)
        obj.map { |o| to_ostruct(o) }
      else
        obj
      end
    end

    private
    def snakeize(value)
      value.to_s.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z\d])([A-Z])/, '\1_\2')
        .downcase
    end

  end
end
