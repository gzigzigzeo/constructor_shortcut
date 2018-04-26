require "constructor_shortcut/version"

# Generates anonymous module containing single class method
module ConstructorShortcut
  # Used to set method name
  # rubocop:disable Metrics/MethodLength
  def self.[](name = :call)
    @cache ||= {}
    @cache[name] ||=
      Module.new do
        @key = name.inspect

        class << self
          def name
            "ConstructorShortcut[#{@key}]"
          end
          alias_method :to_s, :name
          alias_method :to_str, :name
          alias_method :inspect, :name
        end

        define_method name do |*args, &block|
          new(*args, &block).public_send(name)
        end
      end
  end
  # rubocop:enable Metrics/MethodLength
end
