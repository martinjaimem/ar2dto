# frozen_string_literal: true

module AR2DTO
  class DTO
    def initialize(attributes)
      @attributes = attributes
    end

    def ==(other)
      if other.instance_of?(self.class)
        self.class.attribute_names.all? do |attribute|
          public_send(attribute) == other.public_send(attribute)
        end
      else
        super
      end
    end

    private

    attr_reader :attributes
  end
end
