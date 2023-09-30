# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  extend Forwardable
  include Comparable

  def_delegators :@uri, :scheme, :host, :to_s, :query

  def initialize(uri, params = {})
    @uri = URI(uri)

    if @uri.to_s.include?('?')
      @params = @uri.query.split('&').each_with_object({}) do |item, hash|
        hash[item.split('=')[0].to_sym] = item.split('=')[1]
      end
    else
      @params = {}
    end
  end

  def query_params
    @params
  end

  def query_param(key, value = nil)
    @params.fetch(key, value)
  end

  def <=>(other)
    to_s <=> other
  end
end
# END
