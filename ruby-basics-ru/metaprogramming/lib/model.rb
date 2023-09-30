# frozen_string_literal: true

# BEGIN
require 'date'

module Model
  def self.included(base)
    base.extend(ClassMethods)
  end

  attr_accessor :attributes

  def initialize attributes = {}
    @attributes = {}

    self.class.attr_options.each do |name, options|
      value = attributes.key?(name) ? attributes[name] : options.fetch(:default, nil)
      options = self.class.attr_options[name]
      @attributes[name] = self.class.convert_attribute(value, options[:type])
    end
  end

  module ClassMethods
    attr_reader :attr_options

    def convert_attribute(value, type)
      return nil if value.nil?

      case type
      when :datetime
        DateTime.parse value
      when :string
        String value
      when :integer
        Integer value
      when :boolean
        value.to_s == 'true'
      end
    end

    def attribute name, options = {}
      @attr_options ||= {}
      @attr_options[name] = options

      define_method "#{name}" do
        @attributes[name]
      end
      define_method "#{name}=" do |value|
        options = self.class.attr_options[name]
        @attributes[name] = self.class.convert_attribute(value, options[:type])
      end
    end
  end
end
# END
