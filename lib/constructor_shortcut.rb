require "constructor_shortcut/version"
require "constructor_shortcut/cache"

# rubocop:disable Metrics/MethodLength

# Generates anonymous module containing single class method
module ConstructorShortcut
  # Used to set method name
  def self.[](name = :call, class_name = :call)
    @cache ||= {}
    key = "#{name.inspect}, #{class_name.inspect}".freeze

    @cache[key] ||=
      Module.new do
        @key = key

        class << self
          def name
            "ConstructorShortcut[#{@key}]"
          end
          alias_method :to_s, :name
          alias_method :to_str, :name
          alias_method :inspect, :name
        end

        define_method class_name do |*args, &block|
          new(*args, &block).public_send(name)
        end
      end
  end

  def call(*args, &block)
    new(*args, &block).call
  end
end
