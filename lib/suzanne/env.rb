module Suzanne::Env
  extend self

  def respond_to?(method, *)
    ENV.keys.any? { |k| k.upcase == method.to_s.upcase } || super
  end

  private

  def method_missing(method, *args)
    key, punctuation = method.to_s.downcase.match(/^(.+?)([?=])?$/).captures
    key, value = ENV.detect { |k, _| k.upcase == key.upcase }

    if key
      case punctuation
      when "?" then value.nil? ? false : ["t", "true", "1"].include?(value.downcase)
      when "", NilClass then value
      else super
      end
    else
      super
    end
  end

end
